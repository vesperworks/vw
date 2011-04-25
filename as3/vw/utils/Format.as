package vw.utils {



	/**
	 * @author Takashi Murai (KAYAC)
	 */
	public class Format {

		public function Format() {
		}

		public static function timeago(time:*):String {


			var ints:Array = [1, 60, 3600, 86400, 604800, 2592000, 31536000];
			var units:Array = ["秒", "分", "時間", "日", "週", "月", "年"];


			var timer:Number = new Date(time).getTime();
			var gap:Number = ((new Date().getTime()) - timer) / 1000;
			var amount:Number;
			var measure:int;
			var results:String;

			for (var i:int = 0; i < ints.length; i++) {
				if (gap > Number(ints[i])) {
					measure = i;
					trace('gap: ' + (gap));
					trace('measure: ' + (units[measure]));
				}
			}

			amount = gap / ints[measure];
			amount = gap > ints.day ? (Math.round(amount * 100) / 100) : Math.round(amount);
			results = amount + ' ' + units[measure] + '前';

			return results;

		};

		public static function separator(n:Number):String {
			var N:Array = n.toString().split("").reverse();
			for ( var i:int = 3, l:int = N.length; i < l; i += 3 ) {
				if ( N[i] ) {
					N.splice(i, 0, ",");
					i++;
					l++;
				}
			}
			return N.reverse().join("");
		}

		public static function degit(number:Number, figure:int):String {
			var str:String = number.toString();
			for ( var i:int = 0; i < figure; i++ ) {
				str = "0" + str;
			}
			return str.substr(str.length - figure, str.length);
		}

		public static function clearCRLF(str:String):String {
			str = str.replace(/\n/g, "");
			str = str.replace(/\r/g, "");
			str = str.replace(/\r\n/g, "");
			return str;
		}
		
		public static function integrateCRLF(str:String):String {
			str = str.replace(/\r\n/g, "\r");
			str = str.replace(/\n/g, "\r");
			
			return str;
		}

	}
}
