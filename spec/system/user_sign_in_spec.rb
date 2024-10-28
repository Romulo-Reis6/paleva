require "rails_helper"
require "cpf_cnpj"

describe "Usuário se autentica" do
  it "com sucesso" do
    cpf = CPF.generate
    User.create!(email: "email@email.com", password: "123456789012", name: "Rômulo", last_name: "Reis", cpf: cpf)
    visit root_path

    within("form") do
      fill_in "E-mail", with: "email@email.com"
      fill_in "Senha", with: "123456789012"
      click_on "Entrar"
    end

    expect(page).to have_content("Login efetuado com sucesso.")
    within("nav") do
      expect(page).to have_link("Sair")
      expect(page).to have_content("Rômulo Reis")
    end
  end

  it "e faz logout" do
    cpf = CPF.generate
    User.create!(email: "email@email.com", password: "123456789012", name: "Rômulo", last_name: "Reis", cpf: cpf)
    visit root_path

    within("form") do
      fill_in "E-mail", with: "email@email.com"
      fill_in "Senha", with: "123456789012"
      click_on "Entrar"
    end

    click_on "Sair"

    expect(page).to have_content("Logout efetuado com sucesso.")
    expect(page).not_to have_link("Sair")
    expect(page).not_to have_content("Rômulo Reis")

  end
end
