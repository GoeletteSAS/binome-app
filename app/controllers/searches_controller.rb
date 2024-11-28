class SearchesController < ApplicationController

  def show
    @search = Search.find(params[:id])
    # Installer geocoder
    # Configurer geocoder pour fonctionner avec Mapbox
    # Regarder le cours sur geocoder pour mettre la bonne méthode (geocoded_by) dans le model qui contient l'adresse (experience)
    # Essayer de joindre les utilisateurs et les experiences (.joins)
    @matching_users = User.joins(:experiences)
                       .where(experiences: {
                         line_of_work: @search.line_of_work,
                         field: @search.field
                       })

    # Essayer de faire un .where sur les experiences qui ont la même adresse que la search (utiliser .near)
    # et .where sur les experiences qui ont le même line_of_work que la search
    # et .where sur les experiences qui ont le même field que la search
  end


  LINES_OF_WORK = [
    "ventes",
    "production",
    "achats",
    "maintenance",
    "logistique",
    "marketing",
    "comptabilité",
    "contrôle de gestion",
    "trésorerie"
  ]

  FIELDS = [
    "Agroalimentaire",
    "Banque & Assurance",
    "Bois, Papier & Carton",
    "Imprimerie",
    "BTP",
    "Matériaux de construction",
    "Chimie & Parachimie",
    "Commerce, Négoce & Distribution",
    "Édition, Communication & Multimédia",
    "Électronique & Électricité",
    "Études et conseils",
    "Industrie pharmaceutique",
    "Informatique & Télécoms",
    "Machines et équipements & Automobile",
    "Métallurgie & Travail du métal",
    "Plastique & Caoutchouc",
    "Services-aux-entreprises",
    "Textile, Habillement & Chaussure",
    "Transports & Logistique"
  ]

  DEPARTMENTS = [
    "1 Ain",
    "2 Aisne",
    "3 Allier",
    "4 Alpes-de-Haute-Provence",
    "5 Hautes-Alpes",
    "6 Alpes-Maritimes",
    "7 Ardèche",
    "8 Ardennes",
    "9 Ariège",
    "10	Aube",
    "11	Aude",
    "12	Aveyron",
    "13	Bouches-du-Rhône",
    "14	Calvados",
    "15	Cantal",
    "16	Charente",
    "17	Charente-Maritime",
    "18	Cher",
    "19	Corrèze",
    "2A	Corse-du-Sud",
    "2B	Haute-Corse",
    "21	Côte-d'Or",
    "22	Côtes d'Armor",
    "23	Creuse",
    "24	Dordogne",
    "25	Doubs",
    "26	Drôme",
    "27	Eure",
    "28	Eure-et-Loir",
    "29	Finistère",
    "30	Gard",
    "31	Haute-Garonne",
    "32	Gers",
    "33	Gironde",
    "34	Hérault",
    "35	Ille-et-Vilaine",
    "36	Indre",
    "37	Indre-et-Loire",
    "38	Isère",
    "39	Jura",
    "40	Landes",
    "41	Loir-et-Cher",
    "42	Loire",
    "43	Haute-Loire",
    "44	Loire-Atlantique",
    "45	Loiret",
    "46	Lot",
    "47	Lot-et-Garonne",
    "48	Lozère",
    "49	Maine-et-Loire",
    "50	Manche",
    "51	Marne",
    "52	Haute-Marne",
    "53	Mayenne",
    "54	Meurthe-et-Moselle",
    "55	Meuse",
    "56	Morbihan",
    "57	Moselle",
    "58	Nièvre",
    "59	Nord",
    "60	Oise",
    "61	Orne",
    "62	Pas-de-Calais",
    "63	Puy-de-Dôme",
    "64	Pyrénées-Atlantiques",
    "65	Hautes-Pyrénées",
    "66	Pyrénées-Orientales",
    "67	Bas-Rhin",
    "68	Haut-Rhin",
    "69	Rhône",
    "70	Haute-Saône",
    "71	Saône-et-Loire",
    "72	Sarthe",
    "73	Savoie",
    "75	Paris",
    "76	Seine-Maritime",
    "77	Seine-et-Marne",
    "78	Yvelines",
    "79	Deux-Sèvres",
    "80	Somme",
    "81	Tarn",
    "82	Tarn-et-Garonne",
    "83	Var",
    "84	Vaucluse",
    "85	Vendée",
    "86	Vienne",
    "87	Haute-Vienne",
    "88	Vosges",
    "89	Yonne",
    "90	Territoire-de-Belfort",
    "91	Essonne",
    "92	Hauts-de-Seine",
    "93	Seine-Saint-Denis",
    "94	Val-de-Marne",
    "95	Val-D'Oise",
    "971	Guadeloupe",
    "972	Martinique",
    "973	Guyane",
    "974	La Réunion",
    "976	Mayotte",
    "975	Saint-Pierre-et-Miquelon",
    "977	Saint-Barthélémy",
    "978	Saint-Martin",
    "987	Polynésie française",
    "989	Île de Clipperton",
    "986	Wallis-et-Futuna",
    "988	Nouvelle-Calédonie",
    "984	Terres australes et antarctiques françaises"
  ]
  def new
    @search = Search.new
    @lines_of_work = LINES_OF_WORK
    @departments = DEPARTMENTS
    @fields = FIELDS
    # @experience = current_user.experiences.where(is_current: true)
    # if @experience
    #   return
    # else

    # end
  end

  def create
    @search = Search.new(search_params)
    @experience = current_user.experiences.where(is_current: true)
  # if test

  # else
    @search.user = current_user
    if @search.save
      redirect_to dashboard_searches_path
    else
      render 'new', status: :unprocessable_entity
    end
  # end
  end

  def update
    @search = Search.find(params[:id])
    @search.update(search_params)
    redirect_to # à définir
  end

  def destroy
    @search.find(params[:id])
    @search.destroy
    # path à définir
    redirect_to somewhere_path, status: :see_other
  end

  private

  def search_params
    params.require(:search).permit(:user_id, :experience_id, :line_of_work, :field, :address, :is_offering)
  end

end
