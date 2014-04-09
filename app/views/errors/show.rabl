object @error => 'error'
attributes :errors, :status

node :errors do |o|
  o.errors
end
