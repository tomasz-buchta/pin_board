require 'rails_helper'

RSpec.describe BoardsController, :type => :controller do

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:board)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:board,title: nil)
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all boards as @boards" do
      board = Board.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:boards)).to eq([board])
    end
  end

  describe "GET show" do
    it "assigns the requested board as @board" do
      board = Board.create! valid_attributes
      get :show, {:id => board.to_param}, valid_session
      expect(assigns(:board)).to eq(board)
    end
  end

  describe "GET new" do
    it "assigns a new board as @board" do
      get :new, {}, valid_session
      expect(assigns(:board)).to be_a_new(Board)
    end
  end

  describe "GET edit" do
    it "assigns the requested board as @board" do
      board = Board.create! valid_attributes
      get :edit, {:id => board.to_param}, valid_session
      expect(assigns(:board)).to eq(board)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Board" do
        expect {
          post :create, {:board => valid_attributes}, valid_session
        }.to change(Board, :count).by(1)
      end

      it "assigns a newly created board as @board" do
        post :create, {:board => valid_attributes}, valid_session
        expect(assigns(:board)).to be_a(Board)
        expect(assigns(:board)).to be_persisted
      end

      it "redirects to the created board" do
        post :create, {:board => valid_attributes}, valid_session
        expect(response).to redirect_to(Board.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved board as @board" do
        post :create, {:board => invalid_attributes}, valid_session
        expect(assigns(:board)).to be_a_new(Board)
      end

      it "re-renders the 'new' template" do
        post :create, {:board => invalid_attributes}, valid_session
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
        board = Board.create! valid_attributes
        put :update, {:id => board.to_param, :board => new_attributes}, valid_session
        board.reload
        expect(board.title).to eq('updated title')
      end

      it "assigns the requested board as @board" do
        board = Board.create! valid_attributes
        put :update, {:id => board.to_param, :board => valid_attributes}, valid_session
        expect(assigns(:board)).to eq(board)
      end

      it "redirects to the board" do
        board = Board.create! valid_attributes
        put :update, {:id => board.to_param, :board => valid_attributes}, valid_session
        expect(response).to redirect_to(board)
      end
    end

    describe "with invalid params" do
      it "assigns the board as @board" do
        board = Board.create! valid_attributes
        put :update, {:id => board.to_param, :board => invalid_attributes}, valid_session
        expect(assigns(:board)).to eq(board)
      end

      it "re-renders the 'edit' template" do
        board = Board.create! valid_attributes
        put :update, {:id => board.to_param, :board => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested board" do
      board = Board.create! valid_attributes
      expect {
        delete :destroy, {:id => board.to_param}, valid_session
      }.to change(Board, :count).by(-1)
    end

    it "redirects to the boards list" do
      board = Board.create! valid_attributes
      delete :destroy, {:id => board.to_param}, valid_session
      expect(response).to redirect_to(boards_url)
    end
  end

end
