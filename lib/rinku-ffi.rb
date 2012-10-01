require 'ffi'

module Rinku
  VERSION = "1.7.0"
  AUTOLINK_SHORT_DOMAINS=1
  extend FFI::Library

  enum :mode, [
      :urls, 1,
      :email_aaddresses, 2,
      :all, 3
  ]

  class Buf < FFI::Struct
    layout :data, :pointer,
           :size, :size_t,
           :asize, :size_t,
           :unit, :size_t
  end


  ffi_lib File.join(File.dirname(__FILE__), '..', 'ext', 'rinku', 'rinku-ffi.bundle')

  callback :block, [:pointer, :size_t, :pointer], :void
  callback :link_text_cb, [:pointer, :pointer, :block], :void
  attach_function :ffi_create_buf, [], :pointer
  attach_function :ffi_release_buf, [:pointer], :void
  attach_function :ffi_bufput, [:pointer, :string], :void
  attach_function :ffi_autolink, [:pointer, :string, :mode, :uint, :string, :pointer, :link_text_cb, :block], :int

  LINK_TEXT_CB = Proc.new do |link_text, link, block_cb|
    link_ruby = Rinku::Buf.new(link)
    block_cb.call(link_ruby[:data], link_ruby[:size], link_text)
  end

  class << self
    attr_accessor :skip_tags

    def auto_link(text, mode=:all, link_attr=nil, skip_tags=nil, flags=0, &block)
      ob_c = ffi_create_buf()
      ob_ruby = Buf.new(ob_c)
      skip_tags_ruby = skip_tags || self.skip_tags || %w(a pre code kbd script)
      skip_tags_c = FFI::MemoryPointer.new(:pointer, skip_tags_ruby.size+1)
      skip_tags_ruby.each_with_index do |tag, i|
        skip_tags_c[i].put_pointer(0, FFI::MemoryPointer.from_string(tag))
      end
      skip_tags_c[skip_tags_ruby.size].put_pointer(0, nil)

      block_cb = Proc.new do |_in, _in_size, _out_bf|
        out = block.call(_in.read_string(_in_size))
        ffi_bufput(_out_bf, out)
      end

      count = ffi_autolink(ob_c, text, mode.nil? ? :all : mode, flags, link_attr, skip_tags_c, block.nil? ? nil : LINK_TEXT_CB, block_cb)
      if count == 0
        result = text
      else
        str_ptr = ob_ruby[:data]
        result = str_ptr.null? ? nil : str_ptr.read_string(ob_ruby[:size]).force_encoding(text.encoding)
      end
      ffi_release_buf(ob_c)
      result
    end
  end
end

