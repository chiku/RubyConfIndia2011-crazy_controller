Factory.define :crazy_stuff do |f|
  f.sequence(:which_1) { |n| "which one ? #{n}" }
end

Factory.define :conflicted_crazy_stuff, :parent => :crazy_stuff do |f|
  f.sequence(:op) { |n| "op #{n}" }
  f.conflicted true
end
