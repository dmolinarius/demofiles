Date.prototype.hf = heure_francaise;

function heure_francaise() {
	var an    = this.getFullYear();
	var mois  = this.getMonth();
	var date  = this.getDate();
	var jour  = this.getDay();
	var heure = this.getHours();
	var min   = this.getMinutes();
	var sec = this.getSeconds();
	var ms = this.getMilliseconds();

	var liste_mois = ["janvier", "f&eacute;vrier", "mars", "avril",
		"mai", "juin", "juillet", "ao&ucirc;t", "septembre",
		"octobre", "novembre", "d&eacute;cembre" ];

	var liste_jours = ["Dimanche", "Lundi", "Mardi", "Mercredi",
		"Jeudi", "Vendredi", "Samedi"];

	var str = liste_jours[jour] + " " + date + " "
		+ liste_mois[mois] + " " + an + " "
		+ (heure < 10 ? "0" : "") + heure + ":"
		+ (min   < 10 ? "0" : "") + min   ; //+ ":"
		//+ (sec   < 10 ? "0" : "") + sec   + "."
		//+ (ms    < 100? "0" : "") + (ms < 10? "0" : "") + ms;

	return str;
}


