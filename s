
[1mFrom:[0m /home/vishnu/personal/GreenPieceBackend/spec/support/object_creators.rb:33 ObjectCreators#create_user:

    [1;34m21[0m: [32mdef[0m [1;34mcreate_user[0m(params = {})
    [1;34m22[0m:   last_id = [1;34;4mUser[0m.limit([1;34m1[0m).order([35mid[0m: [33m:desc[0m).pluck([33m:id[0m).first || [1;34m0[0m
    [1;34m23[0m:   user = [1;34;4mUser[0m.new(
    [1;34m24[0m:     [35memail[0m: params[[33m:name[0m].present? ? [31m[1;31m"[0m[31m#{params[:name]}[0m[31m@test.com[1;31m"[0m[31m[0m : [31m[1;31m"[0m[31mvishnudev#{last_id+1}[0m[31m@test.com[1;31m"[0m[31m[0m,
    [1;34m25[0m:     [35musername[0m: params[[33m:name[0m].present? ? [31m[1;31m"[0m[31m#{params[:name]}[0m[31m[1;31m"[0m[31m[0m : [31m[1;31m"[0m[31mvishnudev#{last_id+1}[0m[31m[1;31m"[0m[31m[0m,
    [1;34m26[0m:     [35mpassword[0m: [31m[1;31m'[0m[31mvishnudev[1;31m'[0m[31m[0m,
    [1;34m27[0m:     [35mpassword_confirmation[0m: [31m[1;31m'[0m[31mvishnudev[1;31m'[0m[31m[0m,
    [1;34m28[0m:     [35mnome[0m: [31m[1;31m'[0m[31mvishnudev[1;31m'[0m[31m[0m,
    [1;34m29[0m:     [35msobrenome[0m: [31m[1;31m'[0m[31mvishnudev[1;31m'[0m[31m[0m,
    [1;34m30[0m:     [35mtelefone[0m: [31m[1;31m'[0m[31mvishnudev[1;31m'[0m[31m[0m
    [1;34m31[0m:   )
    [1;34m32[0m:   user.skip_confirmation!
 => [1;34m33[0m:   binding.pry
    [1;34m34[0m:   user.save!
    [1;34m35[0m:   user
    [1;34m36[0m: [32mend[0m

