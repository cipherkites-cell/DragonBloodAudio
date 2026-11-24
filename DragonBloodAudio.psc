Scriptname DragonBloodAudio

; 龙血棋音频接口。六个函数全部由 DragonBloodAudio.dll（SKSE 插件）注册。
; 音频文件固定放在 Data\Sound\DragonBlood\<名字>.wav，所以这里只需要传名字。

; 播放一个音效；abLoop=True 用于 BGM（淡入淡出已做在文件里，不依赖引擎循环位）
; 返回句柄 id，失败返回 -1
Int Function Play(String asName, Float afVolume, Bool abLoop) Global native

; 淡出并释放一个句柄
Function Stop(Int aiId) Global native

Function StopAll() Global native

; 循环续播 / 清理已结束的一次性音效。对局期间每 0.25 秒调一次即可
Function Tick() Global native

; 静音 / 还原本体的 Music 音频类别音量
Function MusicMute(Bool abMute) Global native

; dll 是否已注册（装没装插件就看它，别的函数都别在它之前调）
Bool Function IsReady() Global native

; 把全部 SNCT 音频类别（含音量）拼成字符串返回，用来排查“静音没生效”
String Function DiagCategories() Global native
