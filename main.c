#include "pico/stdlib.h"

// Raspberry Pi Pico WでLEDを点滅させるプログラム (Lチカ)
// GP20ピンにLEDを接続し、200ms間隔でON/OFFを繰り返す

int main() {
    // 標準入出力の初期化
    stdio_init_all();

    // GP20ピンをGPIOとして初期化
    gpio_init(20);
    // GP20ピンを出力モードに設定
    gpio_set_dir(20, GPIO_OUT);

    // メインループ: LEDを点滅させる
    while (true) {
        // LEDを点灯 (HIGH)
        gpio_put(20, 1);
        sleep_ms(200);  // 200ms待つ

        // LEDを消灯 (LOW)
        gpio_put(20, 0);
        sleep_ms(200);  // 200ms待つ
    }

    return 0;
}