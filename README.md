# Tutorial

## Raspberry Pi Pico W Lチカプログラムの作成とビルド

### 概要
このチュートリアルでは、Raspberry Pi Pico Wを使用してLEDを点滅させるプログラム（Lチカ）を作成し、ビルドする方法を説明します。GP20ピンにLEDを接続し、200ms間隔で点滅します。

### 要件
- Raspberry Pi Pico W
- LED（GP20ピンに接続）
- 開発環境（Ubuntuなど）

### 工程

#### 1. MicroPythonプログラムの作成
MicroPythonで以下のコードを作成します。

```python
from machine import Pin
from time import sleep

LED_PIN = 20
BLINK_INTERVAL = 0.2

led = Pin(LED_PIN, Pin.OUT)

while True:
    led.value(1)
    sleep(BLINK_INTERVAL)
    led.value(0)
    sleep(BLINK_INTERVAL)
```

#### 2. C言語プログラムの作成
main.cに以下のコードを記述します。

```c
#include "pico/stdlib.h"

int main() {
    stdio_init_all();
    gpio_init(20);
    gpio_set_dir(20, GPIO_OUT);

    while (true) {
        gpio_put(20, 1);
        sleep_ms(200);
        gpio_put(20, 0);
        sleep_ms(200);
    }

    return 0;
}
```

#### 3. Pico SDKのセットアップ
```bash
git clone https://github.com/raspberrypi/pico-sdk.git --depth 1
export PICO_SDK_PATH=/path/to/pico-sdk
```

#### 4. ツールチェーンのインストール
```bash
sudo apt update
sudo apt install gcc-arm-none-eabi
```

#### 5. CMakeLists.txtの作成
プロジェクトルートに以下の内容のCMakeLists.txtを作成します。

```cmake
cmake_minimum_required(VERSION 3.13)

include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)

project(tutorial)

pico_sdk_init()

add_executable(main main.c)

pico_add_extra_outputs(main)

target_link_libraries(main pico_stdlib)
```

#### 6. ビルド
```bash
mkdir build
cd build
cmake ..
make
```

#### 7. Picoへの書き込み
生成されたmain.uf2ファイルをPicoのBOOTSELモードで接続したドライブにドラッグします。