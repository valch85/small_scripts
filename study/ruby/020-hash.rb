month_a = { "jan" => "January", "feb" => "February", "mar" => "March", "apr" => "April", "may" => "May", "jun" => "June", "jul" => "July", "aug" => "August", "sep" => "September", "oct" => "October", "nov" => "November", "des" => "December"}
p month_a
month_arr = { [1, "jan"] => "January", [2, "feb"] => "February", [3, "mar"] => "March", [4, "apr"] => "April", [5, "may"] => "May", [6, "jun"] => "June", [7, "jul"] => "July", [8, "aug"] => "August", [9, "sep"] => "September", [10, "oct"] => "October", [11, "nov"] => "November", [12, "des"] => "December"}
p month_arr

fitzgerald = { 1920 => "This side of paradise", 1925 => "The greate gadsby", 1934 => "Tender is the night"}
p fitzgerald.to_a
novel = fitzgerald.to_s
p novel
novel.gsub!(/\d{4}/, " ") {|token| print token}
p novel