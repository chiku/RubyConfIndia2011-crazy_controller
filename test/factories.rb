Factory.define :crazy_stuff do |f|
  f.sequence(:which_1) { |n| "which one ? #{n}" }
end

Factory.define :conflict_creation do |f|
  f.sequence(:op) { |n| "op #{n}" }
end