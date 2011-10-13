module HomeHelper
def time_tag(date_or_time, *args)
  options  = args.extract_options!
  format   = options.delete(:format) || :long
  content  = args.first || I18n.l(date_or_time, :format => format)
  datetime = date_or_time.acts_like?(:time) ? date_or_time.xmlschema : date_or_time.rfc3339

  content_tag(:time, content, options.reverse_merge(:datetime => datetime))
end
end
