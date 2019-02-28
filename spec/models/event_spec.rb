require 'rails_helper'

RSpec.describe Event, type: :model do
  
  event = described_class.new

  describe "Validations" do 

    it 'is not valid without all required attributes' do 
      event.name = nil
      event.description = nil
      event.start_date = nil
      event.end_date = nil
      event.venue = nil
      event.city = nil
      event.state = nil
      event.country = nil
      expect(event).to_not be_valid
    end

    it 'is not valid without name' do 
      event.name = nil
      expect(event).to_not be_valid
    end 

    it 'is not valid without description' do 
      event.description = nil
      expect(event).to_not be_valid
    end

    it 'is not valid without start date' do 
      event.start_date = nil
      expect(event).to_not be_valid
    end

    it 'is not valid without end date' do 
      event.end_date = nil
      expect(event).to_not be_valid
    end

    it 'is not valid without venue' do 
      event.venue = nil
      expect(event).to_not be_valid
    end

    it 'is not valid without city' do 
      event.city = nil
      expect(event).to_not be_valid
    end

    it 'is not valid without state' do 
      event.state = nil
      expect(event).to_not be_valid
    end

    it 'is not valid without country' do 
      event.country = nil
      expect(event).to_not be_valid
    end

    it 'is not valid if start date is greater than end date' do 
      event.start_date = DateTime.now + 2.hours
      event.end_date = DateTime.now
      expect(event).to_not be_valid
    end

    it 'is valid with all required attributes' do 
      event.name = "Test Event"
      event.description = "Pending..."
      event.start_date = DateTime.now 
      event.end_date = DateTime.now + 4.hours
      event.venue = "Scheme No. 54, Vijaynagar"
      event.city = "Indore"
      event.state = "Madhya Pradesh"
      event.country = "India"
      expect(event).to be_valid
    end

    it 'is valid with name' do 
      event.name = "Test Event"
      expect(event).to be_valid
    end 

    it 'is valid with description' do 
      event.description = "Pending..."
      expect(event).to be_valid
    end

    it 'is valid with start date' do 
      event.start_date = DateTime.now
      expect(event).to be_valid
    end

    it 'is valid with end date' do 
      event.end_date = DateTime.now + 4.hours
      expect(event).to be_valid
    end

    it 'is valid with venue' do 
      event.venue = "Scheme No. 54, Vijaynagar"
      expect(event).to be_valid
    end

    it 'is valid with city' do 
      event.city = "Indore"
      expect(event).to be_valid
    end

    it 'is valid with state' do 
      event.state = "Madhya Pradesh"
      expect(event).to be_valid
    end

    it 'is valid with country' do 
      event.country = "India"
      expect(event).to be_valid
    end

    it 'is valid if start date is less than end date' do 
      event.start_date = DateTime.now
      event.end_date = DateTime.now + 2.hours
      expect(event).to be_valid
    end

  end

end
