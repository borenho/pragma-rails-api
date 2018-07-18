require 'rails_helper'
require 'spec_helper'

RSpec.describe '/api/v1/schools' do
  describe 'GET /' do
    subject { -> { get api_v1_schools_path } }

    let!(:school) { create(:school) }

    it 'responds with 200 OK' do
      subject.call
      expect(response.status).to eq(200)
    end

    it 'responds with the schools' do
      subject.call
      expect(parsed_response['data']).to match_array([
        a_hash_including('id' => school.id)
      ])
    end
  end

  describe 'GET /:id' do
    subject { -> { get api_v1_school_path(school) } }

    let!(:school) { create(:school) }

    it 'responds with 200 OK' do
      subject.call
      expect(last_response.status).to eq(200)
    end

    it 'responds with the school' do
      subject.call
      expect(parsed_response).to match(a_hash_including(
        'id' => school.id
      ))
    end
  end

  describe 'POST /' do
    subject { -> { post api_v1_schools_path, school.to_json } }

    let(:school) { attributes_for(:school) }

    it 'responds with 201 Created' do
      subject.call
      expect(last_response.status).to eq(201)
    end

    it 'creates a new school' do
      expect(subject).to change(::School, :count).by(1)
    end

    it 'responds with the new school' do
      subject.call
      expect(parsed_response).to match(a_hash_including(school.stringify_keys))
    end
  end

  describe 'PATCH /:id' do
    subject do
      proc do
        patch api_v1_school_path(school), new_school.to_json
        school.reload
      end
    end

    let!(:school) { create(:school) }
    let(:new_school) { attributes_for(:school) }

    it 'responds with 200 OK' do
      subject.call
      expect(last_response.status).to eq(200)
    end

    it 'updates the school' do
      subject.call
      expect(school.as_json).to match(a_hash_including(new_school.stringify_keys))
    end

    it 'responds with the updated school' do
      subject.call
      expect(parsed_response).to match(a_hash_including(new_school.stringify_keys))
    end
  end

  describe 'DELETE /:id' do
    subject { -> { delete api_v1_school_path(school) } }

    let!(:school) { create(:school) }

    it 'deletes the school' do
      expect(subject).to change(::School, :count).by(-1)
    end

    it 'responds with 204 No Content' do
      subject.call
      expect(last_response.status).to eq(204)
    end
  end
end
