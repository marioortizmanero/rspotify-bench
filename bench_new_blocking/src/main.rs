use rspotify::{model::Id, prelude::*, ClientCredsSpotify, Credentials};

fn main() {
    let creds = Credentials::from_env().unwrap();
    let mut spotify = ClientCredsSpotify::new(creds);
    spotify.request_token().unwrap();
    let birdy_uri = Id::from_uri("spotify:album:0sNOF9WDwhWunNAHPD3Baj").unwrap();
    let albums = spotify.album(birdy_uri);
    println!("Response: {:?}", albums);
}
