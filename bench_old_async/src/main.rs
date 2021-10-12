#![cfg_attr(test, feature(test))]

extern crate rspotify;

use rspotify::client::Spotify;
use rspotify::oauth2::SpotifyClientCredentials;

#[tokio::main]
async fn main() {
    let client_credential = SpotifyClientCredentials::default().build();
    let spotify = Spotify::default()
        .client_credentials_manager(client_credential)
        .build();
    let birdy_uri = "spotify:album:0sNOF9WDwhWunNAHPD3Baj";
    let albums = spotify.album(birdy_uri).await;
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
