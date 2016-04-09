require "rails_helper"

RSpec.feature "User can edit a playlist" do
  scenario "they can see the name of a newly added song and cannot see the name of a removed song" do
    playlist = create(:playlist_with_songs)
    updated_playlist_name = "Change, change change"
    first, second, third = playlist.songs # need more clarity on this setup
    new_song = create(:song, title: "Somewhere over the rainbow")

    visit playlist_path(playlist)
    click_on "Edit"
    fill_in "playlist_name", with: updated_playlist_name
    uncheck("song-#{first.id}")
    check("song-#{new_song.id}")
    click_on "Update Playlist"

    expect(page).to have_content updated_playlist_name
    expect(page).to have_content new_song.title
    expect(page).to_not have_content first.title
  end
end
