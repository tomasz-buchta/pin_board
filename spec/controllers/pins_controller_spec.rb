require 'rails_helper'

RSpec.describe PinsController, :type => :controller do

  let(:board) {FactoryGirl.create(:board)}

  let(:pin) {FactoryGirl.create(:pin, board_id: board.id)}

  let(:invalid_pin) {FactoryGirl.build(:pin,title: '')}

  let(:invalid_attributes) {FactoryGirl.attributes_for(:pin,title: '')}

  let(:valid_attributes) {FactoryGirl.attributes_for(:pin)}

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all pins as @pins" do
      get :index, board_id: board.id
      expect(assigns(:pins)).to eq([pin])
    end
  end

  describe "GET show" do
    it "assigns the requested pin as @pin" do
      get :show, {board_id: board.id,id: pin.id}
      expect(assigns(:pin)).to eq(pin)
    end
  end

  describe "GET new" do
    it "assigns a new pin as @pin" do
      get :new, board_id: board.id
      expect(assigns(:pin)).to be_a_new(Pin)
    end
  end

  describe "GET edit" do
    it "assigns the requested pin as @pin" do
      get :edit, {board_id: board.id,:id => pin.to_param}, valid_session
      expect(assigns(:pin)).to eq(pin)
    end
  end

  describe "POST create" do
    pending "with valid params" do
      it "creates a new Pin" do
        expect {
          post :create, {board_id: board.id,:pin => valid_attributes}, valid_session
        }.to change(Pin, :count).by(1)
      end

      it "assigns a newly created pin as @pin" do
        post :create, {:pin => valid_attributes}, valid_session
        expect(assigns(:pin)).to be_a(Pin)
        expect(assigns(:pin)).to be_persisted
      end

      it "redirects to the created pin" do
        post :create, {:pin => valid_attributes}, valid_session
        expect(response).to redirect_to(Pin.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pin as @pin" do
        post :create, {board_id: board.id,:pin => invalid_attributes}, valid_session
        expect(assigns(:pin)).to be_a_new(Pin)
      end

      it "re-renders the 'new' template" do
        post :create, {board_id: board.id,:pin => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:pin,title: 'updated title')
      }

      it "updates the requested pin" do
        put :update, {board_id: pin.board.id,:id => pin.to_param, :pin => new_attributes}, valid_session
        pin.reload
        expect(pin.title).to eq('updated title')
      end

      it "assigns the requested pin as @pin" do
        put :update, {board_id: board.id,:id => pin.to_param, :pin => valid_attributes}, valid_session
        expect(assigns(:pin)).to eq(pin)
      end

      it "redirects to the pin" do
        pin = Pin.create! valid_attributes
        put :update, {board_id: board.id,:id => pin.to_param, :pin => valid_attributes}, valid_session
        expect(response).to redirect_to(board_pin_url(board.id,pin))
      end
    end

    describe "with invalid params" do
      it "assigns the pin as @pin" do
        pin = Pin.create! valid_attributes
        put :update, {board_id: board.id,:id => pin.to_param, :pin => invalid_attributes}, valid_session
        expect(assigns(:pin)).to eq(pin)
      end

      it "re-renders the 'edit' template" do
        pin = Pin.create! valid_attributes
        put :update, {board_id: board.id,:id => pin.to_param, :pin => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested pin" do
      pin = Pin.create! valid_attributes
      expect {
        delete :destroy, {board_id: board.id,:id => pin.to_param}, valid_session
      }.to change(Pin, :count).by(-1)
    end

    it "redirects to the pins list" do
      pin = Pin.create! valid_attributes
      delete :destroy, {board_id: board.id,:id => pin.to_param}, valid_session
      expect(response).to redirect_to(board_pins_url(board.id))
    end
  end

end
