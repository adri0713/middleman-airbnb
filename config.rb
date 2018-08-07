activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# p "======================="
# p data.flats.keys.first
# p data.flats.keys.last
# p data.flats.keys

["papillard", "ssaunier", "monsieurpaillard", "julienlegal", "julienlegal"].each do |name|
  proxy "/flats/#{name}.html", "/flats/show.html", locals: { owner: name }, ignore: true
end

activate :sprockets

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  set :relative_links, true
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end
