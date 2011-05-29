Factory.define :crazy_stuff do |f|
  f.sequence(:which_1) { |n| "which one ? #{n}" }
end
