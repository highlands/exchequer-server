class Spinach::Features::ViewingHome < Spinach::FeatureSteps
  step 'I am a visitor on the homepage' do
    visit '/'
  end

  step 'I should see the exchequer headline' do
    expect(current_path).to eq('/')
    expect(find('h1').text).to eq 'Exchequer'
  end
end
