use rspotify::{model::AlbumId, prelude::*, ClientCredsSpotify, Credentials};

pub fn run() {
    let creds = Credentials::from_env().unwrap();
    let mut spotify = ClientCredsSpotify::new(creds);
    spotify.request_token().unwrap();
    let birdy_uri = AlbumId::from_uri("spotify:album:0sNOF9WDwhWunNAHPD3Baj").unwrap();
    let albums = spotify.album(&birdy_uri);
    assert!(albums.is_ok());
}
