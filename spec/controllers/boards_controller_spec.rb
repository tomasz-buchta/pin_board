require 'rails_helper'

RSpec.describe BoardsController, :type => :controller do

  let(:board) {
    FactoryGirl.create(:board) }

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:board,user_id: 1)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:board,title: nil)
  }

  login_user

  describe "GET index" do
    it "assigns all boards as @boards" do
      get :index, {}
      expect(assigns(:boards)).to eq([board])
    end
  end

  describe "GET show" do
    it "assigns the requested board as @board" do
      get :show, {:id => board.to_param}
      expect(assigns(:board)).to eq(board)
    end
  end

  describe "GET new" do
    it "assigns a new board as @board" do
      #FIXME: false positive
      pending 'to be fixed'
      expect(assigns(:board)).to be_a_new(Board)
    end
  end

  describe "GET edit" do
    it "assigns the requested board as @board" do
      get :edit, {:id => board.to_param}
      expect(assigns(:board)).to eq(board)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Board" do
        expect {
          post :create, {:board => valid_attributes}
        }.to change(Board, :count).by(1)
      end

      it "assigns a newly created board as @board" do
        post :create, {:board => valid_attributes}
        expect(assigns(:board)).to be_a(Board)
        expect(assigns(:board)).to be_persisted
      end

      it "redirects to the created board" do
        post :create, {:board => valid_attributes}
        expect(response).to redirect_to(Board.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved board as @board" do
        post :create, {:board => invalid_attributes}
        expect(assigns(:board)).to be_a_new(Board)
      end

      it "re-renders the 'new' template" do
        post :create, {:board => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:board,title: 'updated title')
      }

      it "updates the requested board" do
        put :update, {:id => board.to_param, :board => new_attributes}
        board.reload
        expect(board.title).to eq('updated title')
      end

      it "assigns the requested board as @board" do
        put :update, {:id => board.to_param, :board => valid_attributes}
        expect(assigns(:board)).to eq(board)
      end

      it "redirects to the board" do
        put :update, {:id => board.to_param, :board => valid_attributes}
        expect(response).to redirect_to(board)
      end
    end

    describe "with invalid params" do
      it "assigns the board as @board" do
        put :update, {:id => board.to_param, :board => invalid_attributes}
        expect(assigns(:board)).to eq(board)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => board.to_param, :board => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested board" do
      board = FactoryGirl.create(:board)
      expect {
        delete :destroy, {:id => board.to_param}
      }.to change(Board, :count).by(-1)
    end

    it "redirects to the boards list" do
      delete :destroy, {:id => board.to_param}
      expect(response).to redirect_to(boards_url)
    end

    context 'with pins' do
      let!(:board) {FactoryGirl.create(:board_with_pins)}
      it 'deletes the board' do
        expect {
          delete :destroy, {id: board.to_param}
        }.to change(Board,:count).by(-1)
      end
      it 'deletes associated pins' do
        expect {
          delete :destroy, {id: board.to_param}
        }.to change(Pin,:count).by(-5)
      end
    end

  end

end
