# encoding: utf-8

Quando("eu submeto a sessão com {string}") do |email|
  visit "https://spotlab.herokuapp.com/"
  campo_email = find("#email")
  campo_email.set email
  click_button "Entrar"
end

Então("devo ver a área de administração de spots") do
  expect(page).to have_css(".dashboard")
end

Então("devo ver a mensagem de alerta: {string}") do |mensagem_esperada|
  alert = find(".alert-dark")
  expect(alert).to have_text(mensagem_esperada)
end
