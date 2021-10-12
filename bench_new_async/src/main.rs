#![cfg_attr(test, feature(test))]

use rspotify::{model::AlbumId, prelude::*, ClientCredsSpotify, Credentials};

#[tokio::main]
async fn main() {
    let creds = Credentials::from_env().unwrap();
    let mut spotify = ClientCredsSpotify::new(creds);
    spotify.request_token().await.unwrap();
    let birdy_uri = AlbumId::from_uri("spotify:album:0sNOF9WDwhWunNAHPD3Baj").unwrap();
    let albums = spotify.album(&birdy_uri).await;
    assert!(albums.is_ok());
}

#[cfg(test)]
mod test {
    extern crate test;

    use test::Bencher;
    use super::main;

    #[bench]
    fn bench(bench: &mut Bencher) {
        bench.iter(main)
    }
}
