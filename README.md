# KDE桌面小工具 - 倒數計時

## 安裝
將`package/`複製到`$HOME/.local/share/plasma/plasmoids/net.tobiichi3227.countdown_extension/`

## 設定
### JSON路徑
修改 `$HOME/.local/share/plasma/plasmoids/net.tobiichi3227.countdown_extension/contents/config/main.xml`
```xml
    <entry name="dataConfigPath" type="String">
        <default>Your Json Countdown File Path</default>
    </entry>
```

#### JSON檔格式
```json
[
    {
        "name": "name",
        "date": "2024/1/20"
    },
    {
        "name": "name2",
        "date": "2024/1/21"
    }
]
```

### 字體大小及顏色
```xml
<!-- 預設值 -->
<entry name="nameFontColor" type="Color">
    <label>Name Font Color</label>
    <default>#FFFFFF</default>
</entry>

<entry name="dateFontColor" type="Color">
    <label>Date Font Color</label>
    <default>#FFFFFF</default>
</entry>

<entry name="countdownFontColor" type="Color">
    <label>Countdown Font Color</label>
    <default>#FFFFFF</default>
</entry>

<entry name="nameFontSize" type="Int">
    <label>Sets the size of name font in pixels.</label>
    <default>50</default>
</entry>

<entry name="dateFontSize" type="Int">
    <label>Sets the size of date font in pixels.</label>
    <default>50</default>
</entry>

<entry name="countdownFontSize" type="Int">
    <label>Sets the size of countdown font in pixels.</label>
    <default>50</default>
</entry>

```

### 事件切換時間
```xml
<!-- 預設值 -->
<entry name="switchTime" type="Int">
    <label>Switch Time</label>
    <default>5</default>
</entry>

```

更新JSON檔之後，請重新登入系統，才會顯示更新

Thanks: [LittleCube's gsat-cd](https://github.com/littlecube8152/gsat-cd)
