require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do
  
  describe "POST #create" do
    context "with valid params" do
      it "creates a new playlist" do
        expect {
          post :create, { :playlist => attributes_for(:playlist_with_songs) }
        }.to change(Playlist, :count).by(1)
      end

      it "assigns a newly created playlist as @playlist" do
        post :create, {:playlist => attributes_for(:playlist_with_songs)}
        expect(assigns(:playlist)).to be_a(Playlist)
        expect(assigns(:playlist)).to be_persisted
      end

      it "redirects to the created playlist" do
        post :create, { :playlist => attributes_for(:playlist_with_songs) }
        expect(response).to redirect_to(Playlist.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved playlist" do
        post :create, { :playlist => attributes_for(:playlist_with_songs, name: nil)}
        expect(assigns(:playlist)).to be_a_new(Playlist)
      end

      it "re-renders the 'new' template" do
        post :create, { :playlist => attributes_for(:playlist_with_songs, name: nil) }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates an playlist" do
        playlist = create(:playlist_with_songs)
        put :update, { :id => playlist.to_param, :playlist => attributes_for(:playlist_with_songs, name: "New playlist name")}

        playlist.reload

        expect(playlist.name).to eq("New playlist name")
      end

      it "assigns found playlist as @playlist" do
        playlist = create(:playlist_with_songs)
        put :update, { :id => playlist.to_param, :playlist => attributes_for(:playlist_with_songs, name: "new playlist name")}

        expect(assigns(:playlist)).to eq(playlist)
      end

      it "redirects to updated playlist" do
        playlist = create(:playlist_with_songs)
        put :update, { :id => playlist.to_param, :playlist => attributes_for(:playlist_with_songs, name: "new playlist name") }

        expect(response).to redirect_to(playlist)
      end
    end

    context "with invalid params" do
      it "assigns the playlist as @playlist" do
        playlist = create(:playlist_with_songs)

        put :update, { :id => playlist.to_param, :playlist => attributes_for(:playlist_with_songs, name: nil) }

        expect(assigns(:playlist)).to eq(playlist)
      end

      it "redirects to 'edit' template" do
        playlist = create(:playlist_with_songs)
        put :update, { :id => playlist.to_param, :playlist => attributes_for(:playlist_with_songs, name: nil) }

        expect(response).to render_template("edit")
      end
    end
  end

end
