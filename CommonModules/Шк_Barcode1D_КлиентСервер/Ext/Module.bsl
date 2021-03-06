///Copyright (c) 2021, https://github.com/Larii75 Linchenko Andrii
///
///Разрешается повторное распространение и использование как в виде исходного кода, так и в двоичной форме, с изменениями или без, при соблюдении следующих условий:
///
///При повторном распространении исходного кода должно оставаться указанное выше уведомление об авторском праве, этот список условий и последующий отказ от гарантий.
///При повторном распространении двоичного кода должна сохраняться указанная выше информация об авторском праве, этот список условий и последующий отказ от гарантий 
///в документации и/или в других материалах, поставляемых при распространении. 
///Ни название <Организации>, ни имена её сотрудников не могут быть использованы в качестве поддержки или продвижения продуктов, основанных на этом ПО без предварительного письменного разрешения.
///ЭТА ПРОГРАММА ПРЕДОСТАВЛЕНА ВЛАДЕЛЬЦАМИ АВТОРСКИХ ПРАВ И/ИЛИ ДРУГИМИ СТОРОНАМИ «КАК ОНА ЕСТЬ» БЕЗ КАКОГО-ЛИБО ВИДА ГАРАНТИЙ, ВЫРАЖЕННЫХ ЯВНО ИЛИ ПОДРАЗУМЕВАЕМЫХ, ВКЛЮЧАЯ, НО НЕ ОГРАНИЧИВАЯСЬ ИМИ, 
///ПОДРАЗУМЕВАЕМЫЕ ГАРАНТИИ КОММЕРЧЕСКОЙ ЦЕННОСТИ И ПРИГОДНОСТИ ДЛЯ КОНКРЕТНОЙ ЦЕЛИ. 
///НИ В КОЕМ СЛУЧАЕ НИ ОДИН ВЛАДЕЛЕЦ АВТОРСКИХ ПРАВ И НИ ОДНО ДРУГОЕ ЛИЦО, КОТОРОЕ МОЖЕТ ИЗМЕНЯТЬ И/ИЛИ ПОВТОРНО РАСПРОСТРАНЯТЬ ПРОГРАММУ, КАК БЫЛО СКАЗАНО ВЫШЕ, НЕ НЕСЁТ ОТВЕТСТВЕННОСТИ,
///ВКЛЮЧАЯ ЛЮБЫЕ ОБЩИЕ, СЛУЧАЙНЫЕ, СПЕЦИАЛЬНЫЕ ИЛИ ПОСЛЕДОВАВШИЕ УБЫТКИ, ВСЛЕДСТВИЕ ИСПОЛЬЗОВАНИЯ ИЛИ НЕВОЗМОЖНОСТИ ИСПОЛЬЗОВАНИЯ ПРОГРАММЫ 
///(ВКЛЮЧАЯ, НО НЕ ОГРАНИЧИВАЯСЬ ПОТЕРЕЙ ДАННЫХ, ИЛИ ДАННЫМИ, СТАВШИМИ НЕПРАВИЛЬНЫМИ, ИЛИ ПОТЕРЯМИ, ПРИНЕСЕННЫМИ ИЗ-ЗА ВАС ИЛИ ТРЕТЬИХ ЛИЦ, 
///ИЛИ ОТКАЗОМ ПРОГРАММЫ РАБОТАТЬ СОВМЕСТНО С ДРУГИМИ ПРОГРАММАМИ), ДАЖЕ ЕСЛИ ТАКОЙ ВЛАДЕЛЕЦ ИЛИ ДРУГОЕ ЛИЦО БЫЛИ ИЗВЕЩЕНЫ О ВОЗМОЖНОСТИ ТАКИХ УБЫТКОВ.
///
///Copyright (c) 2021, https://github.com/Larii75 Linchenko Andrii All rights reserved.
///
///Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
///
///Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
///Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
///Neither the name of the <ORGANIZATION> nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
///THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
///THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER 
///OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
///PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
///LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
///EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// Функция - Reg ex тест
//
// Параметры:
//  Строка	 - 	 - 
//  Паттерн	 - 	 - 
// 
// Возвращаемое значение:
//   - 
//
Функция RegExТест(Строка, Паттерн) Экспорт
		
	МояФабрикаXDTO = Новый ФабрикаXDTO(ПодготовитьНаборСхем(ПолучитьМассивXSDДляФабрики("RegExp", Паттерн)));
	XDTORegExp = МояФабрикаXDTO.Тип("http://www.example.com/RegExp", "RegExp");

	Попытка
		RegExp = МояФабрикаXDTO.Создать(XDTORegExp, Строка);
	    Возврат Истина;
	Исключение
	    Возврат Ложь;
	КонецПопытки;	
    
КонецФункции

// Функция - Получить массив XSDДля фабрики
//
// Параметры:
//  ИмяМакета	 - 	 - 
//  Паттерн		 - 	 - 
// 
// Возвращаемое значение:
//   - 
//
Функция ПолучитьМассивXSDДляФабрики(ИмяМакета, Паттерн="")
		
	Результат = Новый Массив;
	
	СтрокаXSD = ПолучитьXSD_RegEx();
	
	Если НЕ Паттерн="" Тогда
		СтрокаXSD = СтрЗаменить(СтрокаXSD, "^", Паттерн);
	КонецЕсли;
	
	Результат.Добавить(СтрокаXSD);	
	
	Возврат Результат;	
	
КонецФункции

// Функция - Получить XSD reg ex
// 
// Возвращаемое значение:
//   - 
//
Функция ПолучитьXSD_RegEx()
	
	Результат = "<?xml version=""1.0"" encoding=""UTF-8""?>
	|<xs:schema xmlns:xs=""http://www.w3.org/2001/XMLSchema""
    |      xmlns:mst=""http://www.example.com/RegExp""
    |       targetNamespace=""http://www.example.com/RegExp"">
  	|<xs:element name=""RE"" type=""mst:RegExp""/>
  	|<xs:simpleType name=""RegExp"">
    |<xs:restriction base=""xs:string"">
    |  <xs:pattern value=""^""/>
    |</xs:restriction>
  	|</xs:simpleType>
	|</xs:schema>";
	
	Возврат Результат;
	
КонецФункции // ПолучитьXSD_RegEx()

// Функция - Подготовить набор схем
//
// Параметры:
//  МассивXSD	 - 	 - 
// 
// Возвращаемое значение:
//   - 
//
Функция ПодготовитьНаборСхем(МассивXSD)
		
	НаборСхем = Новый НаборСхемXML;
	
	Для Каждого ОписаниеXSD Из МассивXSD Цикл		
		ЧтениеXSD = Новый ЧтениеXML;
		ЧтениеXSD.УстановитьСтроку(ОписаниеXSD);
		
		ПостроительDOM = Новый ПостроительDOM;
		ДокументDOM = ПостроительDOM.Прочитать(ЧтениеXSD);
		
		ПостроительСхемыXML = Новый ПостроительСхемXML;
		СхемаXML = ПостроительСхемыXML.СоздатьСхемуXML(ДокументDOM);
		
		НаборСхем.Добавить(СхемаXML);		
	КонецЦикла;
	
	Возврат НаборСхем;
		
КонецФункции

// Функция - Convert long to RGB
//
// Параметры:
//  LongInt			 - 	 - 
//  ВернутьСтруктуру - 	 - 
// 
// Возвращаемое значение:
//   - 
//
Функция ConvertLongToRGB(Знач LongInt, Знач ВернутьСтруктуру=Ложь) Экспорт

	///LongInt = R * (256*256) + G * 256 + B
	
	Результат = Новый Структура("R, G, B", 0, 0, 0);

	Результат.R = Окр(LongInt/(256*256), 0, РежимОкругления.Окр15как10);
	Результат.G = Окр((LongInt/256)%256, 0, РежимОкругления.Окр15как10);
	Результат.B = Окр(LongInt%256, 0, РежимОкругления.Окр15как10);

	Если НЕ ВернутьСтруктуру Тогда
		Результат = Новый Цвет(Результат.R, Результат.G, Результат.B);	
	КонецЕсли;

	Возврат Результат;
 
КонецФункции

// Функция конвертирует hex в dec
//
Функция КонвертироватьHexВDec(Знач ЧислоСтрокой)
    
    Результат = 0;
    Шаблон = "0123456789ABCDEF";
    
    ЧислоСтрокой = ВРег(Строка(ЧислоСтрокой));
    Для ТекущийСимвол = 1 По СтрДлина(ЧислоСтрокой) Цикл
        ПозицияВШаблоне = Найти(Шаблон, Сред(ЧислоСтрокой, ТекущийСимвол, 1))-1;
        Результат = Результат * СтрДлина(Шаблон) + ПозицияВШаблоне;
    КонецЦикла;
    
    Возврат Результат;

КонецФункции

// Функция - Получить соответствие цветов
// 
// Возвращаемое значение:
//   - 
//
Функция ПолучитьСоответствиеЦветов()
	
	Результат = Новый Соответствие;
	
	Результат.Вставить("AliceBlue",	"#F0F8FF:240:248:255");
	Результат.Вставить("AntiqueWhite", "#FAEBD7:250:235:215");
	Результат.Вставить("Aqua", "#00FFFF:0:255:255");
	Результат.Вставить("Aquamarine", "#7FFFD4:127:255:212");
	Результат.Вставить("Azure", "#F0FFFF:240:255:255");
	Результат.Вставить("Beige", "#F5F5DC:245:245:220");
	Результат.Вставить("Bisque", "#FFE4C4:255:228:196");
	Результат.Вставить("Black", "#000000:0:0:0");
	Результат.Вставить("BlanchedAlmond", "#FFEBCD:255:235:205");
	Результат.Вставить("Blue", "#0000FF:0:0:255");
	Результат.Вставить("BlueViolet", "#8A2BE2:138:43:226");
	Результат.Вставить("Brown", "#A52A2A:165:42:42");
	Результат.Вставить("BurlyWood", "#DEB887:222:184:135");
	Результат.Вставить("CadetBlue", "#5F9EA0:95:158:160");
	Результат.Вставить("Chartreuse", "#7FFF00:127:255:0");
	Результат.Вставить("Chocolate", "#D2691E:210:105:30");
	Результат.Вставить("Coral", "#FF7F50:255:127:80");
	Результат.Вставить("CornflowerBlue", "#6495ED:100:149:237");
	Результат.Вставить("Cornsilk", "#FFF8DC:255:248:220");
	Результат.Вставить("Crimson", "#DC143C:220:20:60");
	Результат.Вставить("Cyan", "#00FFFF:0:255:255");
	Результат.Вставить("DarkBlue", "#00008B:0:0:139");
	Результат.Вставить("DarkCyan", "#008B8B:0:139:139");
	Результат.Вставить("DarkGoldenRod", "#B8860B:184:134:11");
	Результат.Вставить("DarkGray", "#A9A9A9:169:169:169");
	Результат.Вставить("DarkGreen", "#006400:0:100:0");
	Результат.Вставить("DarkKhaki", "#BDB76B:189:183:107");
	Результат.Вставить("DarkMagenta", "#8B008B:139:0:139");
	Результат.Вставить("DarkOliveGreen", "#556B2F:85:107:47");
	Результат.Вставить("DarkOrange", "#FF8C00:255:140:0");
	Результат.Вставить("DarkOrchid", "#9932CC:153:50:204");
	Результат.Вставить("DarkRed", "#8B0000:139:0:0");
	Результат.Вставить("DarkSalmon", "#E9967A:233:150:122");
	Результат.Вставить("DarkSeaGreen", "#8FBC8F:143:188:143");
	Результат.Вставить("DarkSlateBlue", "#483D8B:72:61:139");
	Результат.Вставить("DarkSlateGray", "#2F4F4F:47:79:79");
	Результат.Вставить("DarkTurquoise", "#00CED1:0:206:209");
	Результат.Вставить("DarkViolet", "#9400D3:148:0:211");
	Результат.Вставить("DeepPink", "#FF1493:255:20:147");
	Результат.Вставить("DeepSkyBlue", "#00BFFF:0:191:255");
	Результат.Вставить("DimGray", "#696969:105:105:105");
	Результат.Вставить("DodgerBlue", "#1E90FF:30:144:255");
	Результат.Вставить("FireBrick", "#B22222:178:34:34");
	Результат.Вставить("FloralWhite", "#FFFAF0:255:250:240");
	Результат.Вставить("ForestGreen", "#228B22:34:139:34");
	Результат.Вставить("Fuchsia", "#FF00FF:255:0:255");
	Результат.Вставить("Gainsboro", "#DCDCDC:220:220:220");
	Результат.Вставить("GhostWhite", "#F8F8FF:248:248:255");
	Результат.Вставить("Gold", "#FFD700:255:215:0");
	Результат.Вставить("Goldenrod", "#DAA520:218:165:32");
	Результат.Вставить("Gray", "#808080:128:128:128");
	Результат.Вставить("Green", "#008000:0:128:0");
	Результат.Вставить("GreenYellow", "#ADFF2F:173:255:47");
	Результат.Вставить("Honeydew", "#F0FFF0:240:255:240");
	Результат.Вставить("HotPink", "#FF69B4:255:105:180");
	Результат.Вставить("IndianRed", "#CD5C5C:205:92:92");
	Результат.Вставить("Indigo", "#4B0082:75:0:130");
	Результат.Вставить("Ivory", "#FFFFF0:255:255:240");
	Результат.Вставить("Khaki", "#F0E68C:240:230:140");
	Результат.Вставить("Lavender", "#E6E6FA:230:230:250");
	Результат.Вставить("LavenderBlush", "#FFF0F5:255:240:245");
	Результат.Вставить("LawnGreen", "#7CFC00:124:252:0");
	Результат.Вставить("LemonChiffon", "#FFFACD:255:250:205");
	Результат.Вставить("LightBlue", "#ADD8E6:173:216:230");
	Результат.Вставить("LightCoral", "#F08080:240:128:128");
	Результат.Вставить("LightCyan", "#E0FFFF:224:255:255");
	Результат.Вставить("LightGoldenrodYellow", "#FAFAD2:250:250:210");
	Результат.Вставить("LightGray", "#D3D3D3:211:211:211");
	Результат.Вставить("LightGreen", "#90EE90:144:238:144");
	Результат.Вставить("LightPink", "#FFB6C1:255:182:193");
	Результат.Вставить("LightSalmon", "#FFA07A:255:160:122");
	Результат.Вставить("LightSeaGreen", "#20B2AA:32:178:170");
	Результат.Вставить("LightSkyBlue", "#87CEFA:135:206:250");
	Результат.Вставить("LightSlateGray", "#778899:119:136:153");
	Результат.Вставить("LightSteelBlue", "#B0C4DE:176:196:222");
	Результат.Вставить("LightYellow", "#FFFFE0:255:255:224");
	Результат.Вставить("Lime", "#00FF00:0:255:0");
	Результат.Вставить("LimeGreen", "#32CD32:50:205:50");
	Результат.Вставить("Linen", "#FAF0E6:250:240:230");
	Результат.Вставить("Magenta", "#FF00FF:255:0:255");
	Результат.Вставить("Maroon", "#800000:128:0:0");
	Результат.Вставить("MediumAquamarine", "#66CDAA:102:205:170");
	Результат.Вставить("MediumBlue", "#0000CD:0:0:205");
	Результат.Вставить("MediumGreen", "#C0DCC0:192:220:192");
	Результат.Вставить("MediumOrchid", "#BA55D3:186:85:211");
	Результат.Вставить("MediumPurple", "#9370DB:147:112:219");
	Результат.Вставить("MediumSeaGreen", "#3CB371:60:179:113");
	Результат.Вставить("MediumSlateBlue", "#7B68EE:123:104:238");
	Результат.Вставить("MediumSpringGreen", "#00FA9A:0:250:154");
	Результат.Вставить("MediumTurquoise", "#48D1CC:72:209:204");
	Результат.Вставить("MediumVioletRed", "#C71585:199:21:133");
	Результат.Вставить("MidnightBlue", "#191970:25:25:112");
	Результат.Вставить("MintCream", "#F5FFFA:245:255:250");
	Результат.Вставить("MistyRose", "#FFE4E1:255:228:225");
	Результат.Вставить("Moccasin", "#FFE4B5:255:228:181");
	Результат.Вставить("NavajoWhite", "#FFDEAD:255:222:173");
	Результат.Вставить("Navy", "#000080:0:0:128");
	Результат.Вставить("OldLace", "#FDF5E6:253:245:230");
	Результат.Вставить("Olive", "#808000:128:128:0");
	Результат.Вставить("OliveDrab", "#6B8E23:107:142:35");
	Результат.Вставить("Orange", "#FFA500:255:165:0");
	Результат.Вставить("OrangeRed", "#FF4500:255:69:0");
	Результат.Вставить("Orchid", "#DA70D6:218:112:214");
	Результат.Вставить("PaleGoldenrod", "#EEE8AA:238:232:170");
	Результат.Вставить("PaleGreen", "#98FB98:152:251:152");
	Результат.Вставить("PaleTurquoise", "#AFEEEE:175:238:238");
	Результат.Вставить("PaleVioletRed", "#DB7093:219:112:147");
	Результат.Вставить("PapayaWhip", "#FFEFD5:255:239:213");
	Результат.Вставить("PeachPuff", "#FFDAB9:255:218:185");
	Результат.Вставить("Peru", "#CD853F:205:133:63");
	Результат.Вставить("Pink", "#FFC0CB:255:192:203");
	Результат.Вставить("Plum", "#DDA0DD:221:160:221");
	Результат.Вставить("PowderBlue", "#B0E0E6:176:224:230");
	Результат.Вставить("Purple", "#800080:128:0:128");
	Результат.Вставить("Red", "#FF0000:255:0:0");
	Результат.Вставить("RosyBrown", "#BC8F8F:188:143:143");
	Результат.Вставить("RoyalBlue",	"#4169E1:65:105:225");
	Результат.Вставить("SaddleBrown", "#8B4513:139:69:19");
	Результат.Вставить("Salmon", "#FA8072:250:128:114");
	Результат.Вставить("SandyBrown", "#F4A460:244:164:96");
	Результат.Вставить("SeaGreen", "#2E8B57:46:139:87");
	Результат.Вставить("Seashell", "#FFF5EE:255:245:238");
	Результат.Вставить("Sienna", "#A0522D:160:82:45");
	Результат.Вставить("Silver", "#C0C0C0:192:192:192");
	Результат.Вставить("SkyBlue", "#87CEEB:135:206:235");
	Результат.Вставить("SlateBlue", "#6A5ACD:106:90:205");
	Результат.Вставить("SlateGray", "#708090:112:128:144");
	Результат.Вставить("Snow", "#FFFAFA:255:250:250");
	Результат.Вставить("SpringGreen", "#00FF7F:0:255:127");
	Результат.Вставить("SteelBlue",	"#4682B4:70:130:180");
	Результат.Вставить("Tan", "#D2B48C:210:180:140");
	Результат.Вставить("Teal", "#008080:0:128:128");
	Результат.Вставить("Thistle", "#D8BFD8:216:191:216");
	Результат.Вставить("Tomato", "#FF6347:255:99:71");
	Результат.Вставить("Turquoise", "#40E0D0:64:224:208");
	Результат.Вставить("Violet", "#EE82EE:238:130:238");
	Результат.Вставить("Wheat",	"#F5DEB3:245:222:179");
	Результат.Вставить("White", "#FFFFFF:255:255:255");
	Результат.Вставить("WhiteSmoke", "#F5F5F5:245:245:245");
	Результат.Вставить("Yellow", "#FFFF00:255:255:0");
	Результат.Вставить("YellowGreen", "#9ACD32:154:205:50");
	
	Возврат Результат;
		
КонецФункции	
	
// Функция получает абсолютный RGBЦвет
//
Функция ПолучитьАбсолютныйRGBЦвет(Знач Цвет) Экспорт
	
	Результат = Новый Цвет();
	
    Если Цвет.Вид = ВидЦвета.Абсолютный Тогда
        Результат = Цвет;
    ИначеЕсли Цвет.Вид = ВидЦвета.WebЦвет Тогда
        СоответствиеЦветов = ПолучитьСоответствиеЦветов();        
        ЦветИмяПриведеное = Строка(Цвет);
        ЦветИмяПриведеное = Сред(ЦветИмяПриведеное, Найти(ЦветИмяПриведеное, "(") + 1);
        ЦветИмяПриведеное = Сред(ЦветИмяПриведеное, 1, Найти(ЦветИмяПриведеное, ")") - 1);
        
        НайденнаяСтрока = СоответствиеЦветов[ЦветИмяПриведеное];
		Если НайденнаяСтрока <> Неопределено Тогда
			МассивЗначений = СтрРазделить(НайденнаяСтрока, ":");
            Результат = Новый Цвет(Число(МассивЗначений[1]), Число(МассивЗначений[2]), Число(МассивЗначений[3]));
        Иначе
            Результат = Новый Цвет();
        КонецЕсли;
    ИначеЕсли Цвет.Вид = ВидЦвета.WindowsЦвет ИЛИ Цвет.Вид = ВидЦвета.ЭлементСтиля Тогда
        // Невозможно определить цвет, но попытаемся через ФорматированныйДокумент
        ТекстХТМЛДокумента = "";
        Шаблон = "0123456789ABCDEF";
        ФорматированныйДокумент = Новый ФорматированныйДокумент; 
        ФорматированныйДокумент.Добавить("ОпределениеЦвета", Тип("ТекстФорматированногоДокумента")); 
        ФорматированныйДокумент.Элементы[0].Элементы[0].ЦветФона = Цвет; 
        ФорматированныйДокумент.ПолучитьHTML(ТекстХТМЛДокумента, Новый Структура); 
        НомерСимволаЦвета = Найти(ТекстХТМЛДокумента, "background-color: #"); 
        ЦветРезультатHex  = Сред(ТекстХТМЛДокумента, НомерСимволаЦвета + 19, 6);
        Результат = Новый Цвет(КонвертироватьHexВDec(Сред(ЦветРезультатHex, 1, 2)), КонвертироватьHexВDec(Сред(ЦветРезультатHex, 3, 2)), КонвертироватьHexВDec(Сред(ЦветРезультатHex, 5, 2)));
    ИначеЕсли Цвет.Вид = ВидЦвета.АвтоЦвет Тогда
        Результат = Новый Цвет();
	КонецЕсли;
	
	Возврат Результат;

КонецФункции