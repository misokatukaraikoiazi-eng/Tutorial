#include "pico/stdlib.h"
#include "hardware/pwm.h"

// Raspberry Pi Pico W でPWM制御するプログラム
// GP20ピンでPWM出力、デューティー比60%

int main() {
    // 標準入出力の初期化
    stdio_init_all();

    // GP20ピンを初期化
    gpio_init(20);
    
    // GP20ピンをPWM機能に設定
    gpio_set_function(20, GPIO_FUNC_PWM);
    
    // GP20ピンが属するPWMスライスを取得
    uint slice_num = pwm_gpio_to_slice_num(20);
    
    // PWM設定を取得
    pwm_config config = pwm_get_default_config();
    
    // wrap値を設定（カウンタの最大値）
    // wrap=10000で、デューティー比60% = 6000
    pwm_config_set_wrap(&config, 10000);
    
    // PWM設定を適用
    pwm_init(slice_num, &config, true);
    
    // デューティー比60%を設定（level = wrap * 0.6）
    // GP20はチャネルAなので、pwm_set_chan_level で設定
    pwm_set_chan_level(slice_num, PWM_CHAN_A, 6000);
    
    // メインループ
    while (true) {
        sleep_ms(100);
    }
    
    return 0;
}