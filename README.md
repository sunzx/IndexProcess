IndexProcess
============

翻译书籍索引使用的辅助工具, 可以将外文书籍的索引转换为按汉语拼音顺序排列的索引, 并对索引中的页码进行替换.

使用方法
========

1. 编写Pages.txt文件. 文件格式为"原书页码|中文版页码", 如:

1|1
2|1
3|2
4|3
5|3
6|4
7|5
8|6
9|6
10|7

2. 编写Index.txt文件. 文件格式为"层次|原文条目名称|中文条目名称|原书页码", 如:

1|Absolute value circuit|绝对值电路|264
1|AC and DC gain|直流与交流增益|19
2|complication|复杂化|19
2|design procedure for single-supply op amp design|单电源运放电路的设计步骤|36-40
2|simultaneous equations|联立方程|22-34
2|single supply versus dual supply|单电源与双电源|19-22
1|AC to DC converter circuit|交流到直流变换电路|265
1|Active filter design techniques|有源滤波器设计技巧|73
2|biquad filters|双二阶滤波器|98
2|design aids|设计辅助工具|98-103
3|low-pass, high-pass, and bandpass filter design aids|低通、高通、带通滤波器设计辅助工具|98-101
3|notch filter design aids|陷波滤波器设计辅助工具|101
3|Twin-T design aids|双T滤波器设计辅助工具|102
2|fast, practical filter design|快速实用滤波器设计|77-85
3|high-pass filter|高通滤波器|80-81
3|low-pass filter|低通滤波器|80
3|narrow (single-frequency) bandpass filter|窄（单频响应）带通滤波器|81-82
3|notch (single-frequency rejection) filter|陷波（单频抑制）滤波器|83-85
3|wide bandpass filter|宽带通滤波器|82-83
2|high-speed filter design|高速滤波器设计|85-88
3|bandpass filters|带通滤波器|86-88
3|high-pass filters|高通滤波器|86
3|low-pass filters|低通滤波器|86
3|notch filters|陷波滤波器|88
2|narrow vs. wide bandpass filter|窄带通与宽带通滤波器|83
2|single op amp|单运放滤波器|89-97
3|combination bandpass and notch filters|结合使用带通滤波器和陷波滤波器|97
3|single-amplifier notch and multiple-notch filters|单运放陷波滤波器和多频点陷波滤波器|95-96, 95f
3|stagger-tuned and multiple-peak bandpass filters|参差调谐和多峰响应带通滤波器|91-95, 94f
3|three-pole high-pass filters|三极点高通滤波器|90-91
3|three-pole low-pass filters|三极点低通滤波器|89-90
2|transfer function method|传递函数法|74-77
1|Active load|有源负载|146f, 147
1|ADC (analog to digital converter)|模数转换器|3
2|ADC converter characteristics|模数转换器的特性|67-68
2|architectural decisions|结构的确定|70-71
2|comparator|比较器|182
2|input signal characteristics|输入信号的特性|66-67
2|interface characteristics|接口的特性|68-70
2|power supply information|电源的信息|65-66
2|system information|系统的信息|64-65

3. 运行PagesReplace.pl(需要安装Perl以及Unicode::Collate::Locale和Unicode::Collate::CJK::Pinyin两个CPAN模块), 生成Index_out.txt. 如:

交流到直流变换电路（AC to DC converter circuit）, 212
绝对值电路（Absolute value circuit）, 211
模数转换器（ADC (analog to digital converter)）, 2
	比较器（comparator）, 143
	电源的信息（power supply information）, 51
	接口的特性（interface characteristics）, 53
	结构的确定（architectural decisions）, 54
	模数转换器的特性（ADC converter characteristics）, 52
	输入信号的特性（input signal characteristics）, 52
	系统的信息（system information）, 50
有源负载（Active load）, 114f, 114
有源滤波器设计技巧（Active filter design techniques）, 57
	传递函数法（transfer function method）, 58
	单运放滤波器（single op amp）, 69
		参差调谐和多峰响应带通滤波器（stagger-tuned and multiple-peak bandpass filters）, 71, 73f
		单运放陷波滤波器和多频点陷波滤波器（single-amplifier notch and multiple-notch filters）, 74, 74f
		结合使用带通滤波器和陷波滤波器（combination bandpass and notch filters）, 76
		三极点低通滤波器（three-pole low-pass filters）, 69
		三极点高通滤波器（three-pole high-pass filters）, 70
	高速滤波器设计（high-speed filter design）, 67
		带通滤波器（bandpass filters）, 67
		低通滤波器（low-pass filters）, 67
		高通滤波器（high-pass filters）, 67
		陷波滤波器（notch filters）, 69
	快速实用滤波器设计（fast, practical filter design）, 60
		低通滤波器（low-pass filter）, 62
		高通滤波器（high-pass filter）, 62
		宽带通滤波器（wide bandpass filter）, 64
		陷波（单频抑制）滤波器（notch (single-frequency rejection) filter）, 65
		窄（单频响应）带通滤波器（narrow (single-frequency) bandpass filter）, 63
	设计辅助工具（design aids）, 76
		低通、高通、带通滤波器设计辅助工具（low-pass, high-pass, and bandpass filter design aids）, 76
		双T滤波器设计辅助工具（Twin-T design aids）, 80
		陷波滤波器设计辅助工具（notch filter design aids）, 79
	双二阶滤波器（biquad filters）, 76
	窄带通与宽带通滤波器（narrow vs. wide bandpass filter）, 65
直流与交流增益（AC and DC gain）, 15
	单电源与双电源（single supply versus dual supply）, 15
	单电源运放电路的设计步骤（design procedure for single-supply op amp design）, 28
	复杂化（complication）, 15
	联立方程（simultaneous equations）, 17

