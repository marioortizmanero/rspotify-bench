use rspotify::{model::AlbumId, prelude::*, ClientCredsSpotify, Credentials};

#[tokio::main]
async fn main() {
    let creds = Credentials::from_env().unwrap();
    let mut spotify = ClientCredsSpotify::new(creds);
    spotify.request_token().await.unwrap();
    let birdy_uri = AlbumId::from_uri("spotify:album:0sNOF9WDwhWunNAHPD3Baj").unwrap();
    let albums = spotify.album(&birdy_uri).await;
    println!("Response: {:?}", albums);
}
