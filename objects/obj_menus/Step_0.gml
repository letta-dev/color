/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (global.musica) {
    if (!audio_is_playing(snd_music)) {
        audio_play_sound(snd_music, 2, true);
    }
} else {
    if (audio_is_playing(snd_music)) {
        audio_stop_sound(snd_music);
    }
}









