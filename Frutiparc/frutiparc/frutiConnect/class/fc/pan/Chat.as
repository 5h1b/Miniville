class fc.pan.Chat extends fc.Panel{//}
	
	// CONSTNTES
	var dp_arrow = 28;
	var dp_input = 26;
	var marginBottom:Number = 20;
	
	// MovieClip
	var inputArrow:MovieClip;
	var field:cp.MultiTextField;
	var inputField:TextField;

	
	function Chat(){
		this.init();
	}
	
	function init(){
		//_root.test+="[panChat] init()\n"
		this.title="Chat"
		super.init();
	}
		
	function display(){
		super.display();
		// MULTITEXTFIELD
		var initObj = {
			color:0xFFFFFF,
			flBold:true,
			flMask:true,
			scrollInfo:{
				link:"sbRound",
				param:{
					color:{	
						//fore:{main:0x0000FF},
						//back:{shade:0xFF0000}
						fore:{main:this.slot.col.main, shade:0xFFFFFF},
						back:{shade:this.slot.col.main, dark:0xFFFFFF}						
					},
					shadeSpace:2,
					size:14,
					margin:{top:4,side:2}
				}
			}			
		};		
		this.attachMovie("cpMultiTextField","field",100,initObj)
		this.field._y = this.marginUp+this.lineHeight
		//this.field.addText("Skool>Qu�est-ce que les Lumi�res ? La sortie de l�homme de sa minorit� dont il est lui-m�me responsable. Minorit�, c�est-�-dire incapacit� de se servir de son entendement (pouvoir de penser) sans la direction d�autrui, minorit� dont il est lui-m�me responsable (faute) puisque la cause en r�side non dans un d�faut de l�entendement mais dans un manque de d�cision et de courage de s�en servir sans la direction d�autrui. Sapere aude ! (Ose penser) Aie le courage de te servir de ton propre entendement. Voil� la devise des Lumi�res.\n")
		//this.field.addText("Deepnight>La paresse et la l�chet� sont les causes qui expliquent qu�un si grand nombre d�hommes, apr�s que la nature les a affranchi depuis longtemps d�une (de toute) direction �trang�re, reste cependant volontiers, leur vie durant, mineurs, et qu�il soit facile � d�autres de se poser en tuteur des premiers. Il est si ais� d��tre mineur ! Si j�ai un livre qui me tient lieu d�entendement, un directeur qui me tient lieu de conscience, un m�decin qui d�cide pour moi de mon r�gime, etc., je n�ai vraiment pas besoin de me donner de peine moi-m�me. Je n�ai pas besoin de penser pourvu que je puisse payer ; d�autres se chargeront bien de ce travail ennuyeux. Que la grande majorit� des hommes (y compris le sexe faible tout entier) tienne aussi pour tr�s dangereux ce pas en avant vers leur majorit�, outre que c�est une chose p�nible, c�est ce � quoi s�emploient fort bien les tuteurs qui tr�s aimablement (par bont�) ont pris sur eux d�exercer une haute direction sur l�humanit�. Apr�s avoir rendu bien sot leur b�tail (domestique) et avoir soigneusement pris garde que ces paisibles cr�atures n�aient pas la permission d�oser faire le moindre pas, hors du parc ou ils les ont enferm�. Ils leur montrent les dangers qui les menace, si elles essayent de s�aventurer seules au dehors. Or, ce danger n�est vraiment pas si grand, car elles apprendraient bien enfin, apr�s quelques chutes, � marcher ; mais un accident de cette sorte rend n�anmoins timide, et la frayeur qui en r�sulte, d�tourne ordinairement d�en refaire l�essai.\n")
		//this.field.addText("Yota>Il est donc difficile pour chaque individu s�par�ment de sortir de la minorit� qui est presque devenue pour lui, nature. Il s�y est si bien complu, et il est pour le moment r�ellement incapable de se servir de son propre entendement, parce qu�on ne l�a jamais laiss� en faire l�essai. Institutions (pr�ceptes) et formules, ces instruments m�caniques de l�usage de la parole ou plut�t d�un mauvais usage des dons naturels, (d�un mauvais usage raisonnable) voil� les grelots que l�on a attach�s au pied d�une minorit� qui persiste. Quiconque m�me les rejetterait, ne pourrait faire qu�un saut mal assur� par-dessus les foss�s les plus �troits, parce qu�il n�est pas habitu� � remuer ses jambes en libert�. Aussi sont-ils peu nombreux, ceux qui sont arriv�s par leur propre travail de leur esprit � s�arracher � la minorit� et � pouvoir marcher d�un pas assur�.\n")
		//this.field.addText("Warp>Mais qu�un public s��claire lui-m�me, rentre davantage dans le domaine du possible, c�est m�me pour peu qu�on lui en laisse la libert�, � peu pr�s in�vitable. Car on rencontrera toujours quelques hommes qui pensent de leur propre chef, parmi les tuteurs patent�s (attitr�s) de la masse et qui, apr�s avoir eux-m�mes secou� le joug de la (leur) minorit�, r�pandront l�esprit d�une estimation raisonnable de sa valeur propre et de la vocation de chaque homme � penser par soi-m�me. Notons en particulier que le public qui avait �t� mis auparavant par eux sous ce joug, les force ensuite lui-m�me � se placer dessous, une fois qu�il a �t� incit� � l�insurrection par quelques-uns de ses tuteurs incapables eux-m�mes de toute lumi�re : tant il est pr�judiciable d�inculquer des pr�jug�s parce qu�en fin de compte ils se vengent eux-m�mes de ceux qui en furent les auteurs ou de leurs devanciers. Aussi un public ne peut-il parvenir que lentement aux lumi�res. Une r�volution peut bien entra�ner une chute du despotisme personnel et de l�oppression int�ress�e ou ambitieuse, (cupide et autoritaire) mais jamais une vraie r�forme de la m�thode de penser ; tout au contraire, de nouveaux pr�jug�s surgiront qui serviront, aussi bien que les anciens de lisi�re � la grande masse priv�e de pens�e.\n")

		// INPUTFIELD
		var tf = new TextInfo();
		tf.textFormat.color = 0xFFFFFF//0x888800
		tf.textFormat.size = 11;
		tf.textFormat.bold = true;
		tf.fieldProperty.selectable = true;
		tf.fieldProperty.type = "input"
		tf.attachField(this,"inputField",this.dp_input)
		this.inputField._height = this.marginBottom
		this.inputField._x = 18
		this.inputField.onSetFocus = function(){
			this._parent.root.keyEnterCallback = {obj:this._parent, method:"sendMessage"}
		}
		// INPUTARROW
		this.attachMovie("inputArrow","inputArrow",this.dp_arrow)
	};
	
	function update(){
		super.update();
		this.drawLine(this.size.h - this.marginBottom);	
		// MULTITEXTFIELD
		this.field.extWidth = this.size.w 
		this.field.extHeight = this.size.h - (this.marginUp + this.marginBottom + this.lineHeight*2 )
		this.field.updateSize();
		// INPUTFIELD
		this.inputField._width = this.size.w-18;
		this.inputField._y = this.size.h+2 - this.marginBottom;
		// INPUTARROW
		this.inputArrow._y = this.size.h		
	}
	
	function sendMessage(){
		//_root.test += "sendMessage\n"
		if(this.inputField.text!=""){
			var t = this.inputField.text;
			t = FEString.unHTML(t);
			this.root.manager.sendMessage(t);
		}
		this.inputField.text = "";
	}
	
	function receiveMessage(txt){
		this.field.addText(FEString.unHTML(txt))
	}
	
	
//{	
}
