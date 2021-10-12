use rspotify::client::Spotify;
use rspotify::oauth2::SpotifyClientCredentials;

#[tokio::main]
pub async fn run() {
    let client_credential = SpotifyClientCredentials::default().build();
    let spotify = Spotify::default()
        .client_credentials_manager(client_credential)
        .build();
    let birdy_uri = "spotify:album:0sNOF9WDwhWunNAHPD3Baj";
    let albums = spotify.album(birdy_uri).await;
    assert!(albums.is_ok());
}
