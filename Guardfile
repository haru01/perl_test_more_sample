# A sample Guardfile
# # More info at https://github.com/guard/guard#readme


guard :shell do
  watch /(.*\.t)/ do |m|
    `prove t`
  end
end
