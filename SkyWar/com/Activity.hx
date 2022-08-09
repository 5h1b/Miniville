import Datas;
class Activity{//}

	public var type:ActivityType;

	public var freq:Int;			// Frequence a laquelle l'action est produite
	public var crewCoef:Float;		// Coef de reduction de la frequence appliqu� pour chaque homme au del� du premier.
	public var crewMax:Int;			// population maximum pour cette activit�
	public var crew:Array<Man>;		// liste de la population pr�sente sur cette activit�.
	public var cost:Array<Cost>;		// cout de l'activit�

	public var structure:Structure;		// Structure contenant l'activit�

	public function new( st ){

		structure = st;

		freq = 60;
		crewCoef = 0.75;
		crewMax = 4;
		crew = [];
		st.act.push(this);
	}


//{
}