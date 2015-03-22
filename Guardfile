group 'livereload' do
  guard 'livereload', port: 8002 do
    watch(%r{app/views/.+\.(erb|haml|slim)$})
    watch(%r{app/controllers/.+\.(rb)$})
    watch(%r{app/models/.+\.(rb)$})
    watch(%r{app/lib/.+\.(rb)$})
    watch(%r{app/helpers/.+\.rb})
    watch(%r{public/.+\.(css|js|html)})
    watch(%r{config/locales/.+\.yml})
    # Rails Assets Pipeline
    watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
  end

end

group 'rails' do
  guard 'rails', port: 3041 do
    watch(%r{Gemfile.+})
    watch(%r{app/config/.+})
  end
end

