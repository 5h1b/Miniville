package mt.m3d;

class Quat {
	
	public var x : Float;
	public var y : Float;
	public var z : Float;
	public var w : Float;
	
	public function new() {
		x = 0;
		y = 0;
		z = 0;
		w = 1;
	}
	
	public function length() {
		return Math.sqrt(x * x + y * y + z * z + w * w);
	}
	
	public function initAxis( x : Float, y : Float, z : Float, a : Float ) {
		var sin = Math.sin(a / 2);
		var cos = Math.cos(a / 2);
		this.x = x * sin;
		this.y = y * sin;
		this.z = z * sin;
		this.w = cos;
		this.normalize();
	}
	
	public function normalize() {
		var len = length();
		if( len < 1e-9 ) {
			x = y = z = 0;
			w = 1;
		} else {
			var m = 1 / len;
			x *= m;
			y *= m;
			z *= m;
			w *= m;
		}
	}
	
	public function initRotation( ax : Float, ay : Float, az : Float ) {
		var fSinPitch = Math.sin( ax * 0.5 );
		var fCosPitch = Math.cos( ax * 0.5 );
		var fSinYaw = Math.sin( ay * 0.5 );
		var fCosYaw = Math.cos( ay * 0.5 );
		var fSinRoll = Math.sin( az * 0.5 );
		var fCosRoll = Math.cos( az * 0.5 );
		var fCosPitchCosYaw = fCosPitch * fCosYaw;
		var fSinPitchSinYaw = fSinPitch * fSinYaw;
		x = fSinRoll * fCosPitchCosYaw - fCosRoll * fSinPitchSinYaw;
		y = fCosRoll * fSinPitch * fCosYaw + fSinRoll * fCosPitch * fSinYaw;
		z = fCosRoll * fCosPitch * fSinYaw - fSinRoll * fSinPitch * fCosYaw;
		w = fCosRoll * fCosPitchCosYaw + fSinRoll * fSinPitchSinYaw;
	}
	
	public function toMatrix() {
		var xx = x * x;
		var xy = x * y;
		var xz = x * z;
		var xw = x * w;
		var yy = y * y;
		var yz = y * z;
		var yw = y * w;
		var zz = z * z;
		var zw = z * w;
		var m = new Matrix();
		m._11 = 1 - 2 * ( yy + zz );
		m._12 = 2 * ( xy - zw );
		m._13 = 2 * ( xz + yw );
		m._14 = 0;
		m._21 = 2 * ( xy + zw );
		m._22 = 1 - 2 * ( xx + zz );
		m._23 = 2 * ( yz - xw );
		m._24 = 0;
		m._31 = 2 * ( xz - yw );
		m._32 = 2 * ( yz + xw );
		m._33 = 1 - 2 * ( xx + yy );
		m._34 = 0;
		m._41 = 0;
		m._42 = 0;
		m._43 = 0;
		m._44 = 1;
		return m;
	}
	
}
