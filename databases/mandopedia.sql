-- MariaDB dump 10.19  Distrib 10.6.7-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mandopedia
-- ------------------------------------------------------
-- Server version	10.6.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Temporada 1','Principales personajes de la primera temporada','season1.jpg'),(2,'Temporada 2','Personajes que aparecen por primera vez en esta temporada','season2.png');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modification`
--

DROP TABLE IF EXISTS `modification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `text_modification` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `saved` tinyint(1) NOT NULL,
  `new_text` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EF6425D2F675F31B` (`author_id`),
  KEY `IDX_EF6425D24B89032C` (`post_id`),
  CONSTRAINT `FK_EF6425D24B89032C` FOREIGN KEY (`post_id`) REFERENCES `publication` (`id`),
  CONSTRAINT `FK_EF6425D2F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `name_publication` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_publication` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_publication` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_AF3C6779AC122BA5` (`name_publication`),
  KEY `IDX_AF3C677912469DE2` (`category_id`),
  KEY `IDX_AF3C6779F675F31B` (`author_id`),
  CONSTRAINT `FK_AF3C677976404F3C` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_AF3C6779A545015` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication`
--

LOCK TABLES `publication` WRITE;
/*!40000 ALTER TABLE `publication` DISABLE KEYS */;
INSERT INTO `publication` VALUES (1,1,7,'Din Djarin','Din Djarin, conocido como "el Mandaloriano" o "Mando", fue un hombre humano mandaloriano que trabaj?? como cazarrecompensas durante la Era de la Nueva Rep??blica.\r\n\r\nEn su juventud, Din Djarin vivi?? con sus padres en un planeta no identificado que fue v??ctima de un ataque separatista en el que sus padres perdieron la vida protegi??ndolo. Un superdroide de batalla lo sac?? y lo habr??a matado sin la intervenci??n de Death Watch. Este tr??gico acontecimiento permaneci?? en su memoria a??os m??s tarde.\r\n\r\nTiempo despu??s, se uni?? a un clan mandaloriano llamado \"La Tribu\", asentado en un mundo volc??nico. Cuando tuvo la edad suficiente, Din prometi?? lealtad al credo mandaloriano, convirti??ndose as?? en uno de los suyos y adquiriendo armaduras y armas de su nuevo pueblo, antes de unirse al gremio de cazadores de recompensas.\r\n\r\nMando respeta profundamente el credo de Mandalore, al igual que las reglas de la Tribu, es decir: nunca se quitar?? el casco delante de un ser vivo, aunque esa vida dependa y le impida a alguien hacerlo.\r\n\r\nDebido a que ??l mismo ha sido hu??rfano, parece tener una profunda simpat??a por los dem??s hu??rfanos y esta misma simpat??a se extiende tambi??n a \"El Ni??o\" que inicialmente fue un objetivo para ??l. Se ve la transformaci??n de c??mo primero cuida solo de la seguridad de El Ni??o para conseguir su pago, hasta arriesgar su vida para salvarlo, traicionando al gremio de cazarrecompensas, y desobedeciendo las mism??simas reglas de Los Hijos de la Guardia, las cuales han regido su vida y definido su moral, solo para poder salvar al Ni??o y verlo otro d??a m??s.','mando.jpg'),(2,1,7,'La Armera','Durante la ??poca de la Nueva Rep??blica, la armera era miembro de la Tribu y su l??der, los cuales resid??an en un enclave mandaloriano en el planeta volc??nico Nevarro. Debido a la Gran Purga perpetuada por el Imperio Gal??ctico contra los mandalorianos, la Tribu se vio obligada a permanecer oculta en dicho enclave.\r\n\r\nLa Armera forj?? a petici??n de Din Djaron una hombrera de b??skar puro, a partir de una tablilla del mismo material obtenida por ??ste como anticipo a la caza del activo: el Ni??o. \"??sto fue obtenido en la Gran Purga, es bueno que vuelva a la Tribu\".\r\nTras entregar Din Djarin el Ni??o al remanente imperial y cumplir con su contrato, le pide forjar una coraza de beskar con el cargamento obtenido. Le dice que lo restante de b??skar sea entregado a los hu??rfanos como ayuda econ??mica, a lo que responde la Armera:  \"Los hu??rfanos son el futuro, ??ste es el camino\".\r\n\r\nTras rescatar Din Djarin al Ni??o de los imperiales conociendo que le aguardaba un corto futuro lleno de experimentos al poseer ??ste la fuerza, lo lleva ante La Armera, quien le explica c??mo eones atr??s los mandalorianos lucharon contra una orden de magos llamados \"jedi\". En ese momento, La Armera le forja un cuerno de barro, el s??mbolo del animal que ten??a que matar Mando en un contrato, y del que fue salvado gracias al Ni??o. \"Ahora sois un clan de dos\".\r\nTambi??n le forja \"p??jaros silbadores\", una arma efectiva contra m??ltiples enemigos, y una mochila propulsora, tendiendo as?? Mando su equipo completo.\r\nLe encomend?? a Djarin la misi??n de entregar al Ni??o a los de su especie, y mientras no estuviera con ellos, estar??a bajo su protecci??n.\r\n\r\nM??s tarde, tras estos acontecimientos, queda revelada la posici??n del enclave al Imperio, quienes no dudan en masacrar a los pocos mandalorianos que hab??a.\r\nEllos tienen que huir del planeta, pero la Armera se queda, para enfentrarse a tantos imperiales como pueda, y vengar a su clan asesinado.','armorer.png'),(3,2,7,'Bo-Katan','Bo-Katan Kryze es una mandaloriana de raza humana, quien anta??o fuera hermana de la duqesa Satine Kryze, y lider de los mandalorianos durante la Gran Purga hecha por el Imperio para aniquilar a su raza. \r\n\r\nMucho m??s tarde de estos acontecimientos, se encontrar??a con Din Djarin en Trask, donde hab??a sido atacado por piratas quarren que intentaron matarlo a ??l y al Ni??o para robar su armadura. Bo-Katan y su escuadr??n los rescataron, pidi??ndole que los ayudara a robar armas y suministros imperiales a cambio de ayuda para encontrar al Jedi a quien devolverle el Ni??o. Al principio, Din Djarin se molest?? cuando Bo-Katan se quit?? el casco, creyendo que no era mandaloriana. Sin embargo, esto result?? ser la norma para la mayor??a de los mandalorianos, ya que se sorprendi?? al saber que era parte de una secta que se separ?? de la sociedad mandaloriana dominante a favor de las viejas costumbres. Djarin estuvo de acuerdo y procedi?? a ayudarlos a tomar el barco de transporte. Una vez all??, Bo-Katan le pregunt?? al capit??n por la ubicaci??n del moff Gideon para recuperar su sable oscuro, pero sin ??xito al suicidarse ??ste.\r\n\r\nBo-Katan trat?? de convencer a Djarin para que se uniera a ella, pero ??ste le dijo que ten??a que seguir con su b??squeda. Entendi??ndolo, Bo-Katan le dijo que buscara a Ahsoka Tano en la ciudad de Calodan en el mundo forestal de Corvus.\r\n\r\nAlg??n tiempo despu??s, Din Djarin la busc?? y se solicit?? ayudar para recuperar a Grogu (El Ni??o) de las garras de Gideon. Al principio se neg??, pero cambi?? de paracer al saber que Djarin ten??a las coordenadas del crucero de Gideon. Le pidi?? al moff para recuperar el sable oscuro, y el crucero para la reconquista de Mandalore, a lo que Mando respondi?? \"Ay??dame a encontrar al Ni??o y tendr??s todo lo que quieras, ??l es mi ??nica prioridad\".\r\n\r\nTras estos acontencimientos, los planes de Bo-Katan se vieron fustrados al encontrarse Mando con Gideon, y obtener el sable tras luchar con ??l y salvar a Grogu. Como m??s tarde explica el moff, el sable oscuro solo puede ganarse en batalla, como parte de la tradici??n para poder gobernar Mandalore, por lo que Bo no pudo acept??rselo a Din Djarin.','bo-katan.png'),(4,2,7,'Moff Gideon','Humano que lider?? uno de los remanentes imperiales que surgieron tras la destrucci??n de la Segunda Estrella de la Muerte, y la derrota del Imperio en la Guerra Civil Gal??ctica.\r\n\r\nDespu??s de esta guerra, se pens?? que hab??a sido ejecutado por cometer una serie de cr??menes de guerra, pero se descubri?? que fingi?? su propia muerte y cre?? en secreto un peque??o ej??rcito imperial. Poco despu??s, Gideon rob?? el legendario sable de luz mandaloriano, conocido como sable oscuro, de su leg??timo due??o Bo-Katan Kryze, y supervis?? la Gran Purga, un ataque imperial en Mandalore que dej?? el planeta inhabitable.\r\n\r\nTras la destrucci??n de la segunda Estrella de la Muerte, Gideon comenz?? a participar en los intentos de crear clones que pudieran dise??arse para tener poderes de la Fuerza. Para lograr este fin, busc?? obtener al beb?? sensible a la Fuerza conocido como Grogu, y usar su sangre la cual ten??a una concentraci??n extremadamente alta de midiclorianos.\r\n\r\nEra fr??o, calculador y brutal, de hecho ejecut?? a uno de sus hombres por interrumpirlo sin querer.\r\nCuando Din Djarin lo expuls?? del planeta Nevarro junto al resto de fuerzas remanentes imperiales, se convirti?? en algo personal para Gideon, quien comenz?? a supervisar el desarrollo de una tercera generaci??n de Dark Troopers, la cual empez?? siendo un pesado traje de soldado de asalto hasta eliminar por completo al humano que hab??a dentro y convertirse en droides.\r\n\r\nTambi??n era extremadamente inteligente calculando los pasos de sus enemigos, y se enfrent?? a Din Djarin cuando invadieron su crucero ??l, Fennec Shand, Bo-Katan y Cara Dune al rescate de Grogu, para evitar pelear con Bo-Katan, y en caso de perder que ella no pudiese portar el sable oscuro, al poder ser ??ste s??lo llevado por quien lo ganase en combate.','gideon.png'),(5,2,7,'Luke Skywalker','Fue un Jedi masculino humano que creci?? en Tatooine.\r\nDespu??s de crecer, eventualmente se convirti?? en parte de la lucha contra el Imperio Gal??ctico, teniendo un papel clave en su ca??da en el 4 DBY. No est?? claro qu?? hizo despu??s, pero en alg??n momento del 9 DBY, Grogu se puso en contacto con ??l mientras meditaba en unas ruinas rocosas en Tython, en busca de un compa??ero usuario de la fuerza.\r\n\r\nNo mucho despu??s, Luke pudo localizar al ni??o en el crucero ligero de Gideon. Lleg?? al crucero en su caza X-wing y destruy?? a todos los Soldados Oscuros en la nave mientras se dirig??a a la sala de control.\r\n\r\nGrogu sinti?? su llegada a trav??s de la fuerza, y estando todos (Din Djarin, Grogu, Bo-Katan, Koska Reeves, Cara Dune y Fennec Shand) a punto de morir a manos de los Dark Troopers, Luke los salv?? como hizo anta??o con los miembros de la rebeli??n, y trayendo de vuelta al lado luminoso a su padre, Darth Vader.\r\n\r\nAll?? acord?? con Din Djarin que tomar??a a Grogu como su aprendiz y prometi?? protegerlo con su vida.\r\n\r\nEsta fue sin duda una de las escenas m??s emotivas y esperadas por todo el fandom de Star Wars, al traer de vuelta al Luke conocidos por todos, el que arriesga su vida, con tal de poder salvar a todos los que pueda, sin importarle el costo de tales actos. Un broche de oro para una de las mejores series de esta nuestra querida galaxia.','luke.png'),(6,2,7,'Boba Fett','Boba Fett es un clon de Jango Fett, el ??nico clon inalterado tratado como hijo por Jango.\r\n\r\nTras los acontecimientos de las pel??culas, Boba escap?? del Sarlacc con vida, y tiempo despu??s encontr?? a Fennec Shand dejada a su suerte en las arenas de Tattoine.\r\nConsigui?? que la salvasen, y despu??s le ofreci?? trabajo para luchar juntos, a lo que ella accedi??.\r\n\r\nDespu??s Boba Fett y Fennec Shand fueron a Tython como amigos para encontrarse con Din. ??l quer??a recuperar su armadura, la cual estaba en el interior del Razor Crest. A cambio de ella Boba le prometi?? a Din que cuidar??an de Grogu, a lo que ??ste accedi??. Tras luchar con los soldados de asalto y perder a Grogu por los soldados oscuros que lo capturaron, Boba le mostr?? a Din un holograma que dec??a que la armadura de Jango le pertenec??a a su padre y ??ste se la di??. Cumpliendo con su trato, Boba us?? el Esclavo 1 para llevar a Din e idear un plan de rescate.\r\n\r\nPrimero hab??a que hacerse con las coordenadas del crucero del moff, yendo Din y Migs Mayfeld a la refiner??a imperial en Morak, en donde las obtuvieron y fueron evacuados por Boba.\r\nTras ello, le pidieron ayuda a Bo-Katan, capturaron al doctor Pershing e idearon un plan para hacerse con el crucero de Gideon.\r\n\r\nEste plan consist??a en que Bo-Katan, Cara Dune, Fennec Shand y Koska Reeves ir??an en el transbordador imperial enviando una se??al de socorro por los disparos del Esclavo 1.\r\nCuando el grupo sali?? del hiperespacio, ejecutaron su plan permitiendo al transbordador entrar en el crucero. Una vez all??, Fett se dispuso a atacar a los cazas TIE antes de saltar al hiperespacio, dejando que el equipo de infiltraci??n terminara la misi??n.','boba.png'),(7,1,7,'Fennec Shand','Fennec era un nuevo miembro del Gremio de Cazarrecompensas durante el Imperio. Ahora, una temida asesina que trabajaba durante la era de la Nueva Rep??blica, Fennec permaneci?? escondida en el planeta Tatooine despu??s del arresto de sus empleadores.\r\nAll??, se cruzar??a con Din Djarin, quien acord?? trabajar junto al novato Toro Calican en su caza de Fennec Shand, a cambio de dinero para obtener piezas de repuesto para su nave Razor Crest.\r\nAmbos intentan ir a por Fennec, quien teniendo la altura desde una colina, le dispara a Din en su armadura de beskar. Esto hacen que decidan posponer su cacer??a.\r\n\r\nAl caer la noche y usar unas bengalas flash para cegar a Fennec, consiguen acercarse, pero no sin antes ser destrudio el speeder de Mando por Fennec. Toro lleg?? por la espalda y le apunt?? en la cabeza. Tras tener que ir Mando a por otro bantha para llev??rsela, Fennec intenta manipular a Toro para trabajar juntos en contra de Mando, quien ten??a una recompensa muy alta. Toro decide matarla e ir a por Mando, quien al llegar y darla por muerta ve que Toro le hab??a traicionado. M??s tarde lo encuentra y mata.\r\n\r\nTras ??sto, Fennec ser??a rescatada por Boba y decide ser su socia.\r\nAcompa??ando a Boba a recuperar su armadura de Din en Tython, y tras hacer un trato con ??ste para devolv??rsela a cambio de proteger a Grogu, van al crucero ligero de Gideon, quien captur?? al Ni??o. All??, lo invaden y junto a Cara Dune, Bo-Katan y Koska Reevs se hacen con el control de la nave, rescatan a Grogu y gracias a la ayuda de Luke Skywalker, consiguen salir con vida del ej??rcito de soldados oscuros.','fennec.png'),(8,2,7,'Ahsoka Tano','Mujer togrutta, padawan de Anakin Skywalker durante las Guerras Clon, que abandon?? la Orden Jedi tras ser expulsada de manera injusta, y luego invitada a volver.\r\n\r\nDin Djarin tiene la tarea de llevar a \"El Ni??o\" a los Jedi, y luego de una misi??n con Bo-Katan, se dirige a la ciudad de Calodan en Corvus, donde vive Ahsoka.\r\n\r\nAhsoka se ha hecho enemiga de la magistrada corrupta de la ciudad, Morgan Elsbeth, quien trabaja para el Imperio y env??a repetidamente a sus tropas para intentar matarla.\r\nDjarin y el Ni??o llegan un tiempo despu??s y la magistrada le dice que mate a Ahsoka, a cambio, ella le dar?? su lanza hecha de beskar puro. Djarin y Ahsoka se encuentran y pelean brevemente fuera de la ciudad antes de que Djarin se dirija a ella por su nombre y diga que Bo-Katan lo envi??, haciendo que se detenga.\r\n\r\nLos tres acampan y el Ni??o y Ahsoka se comunican a trav??s de la Fuerza (ya que todav??a no puede pronunciar oraciones completas). A trav??s de esto, Ahsoka le revela a Djarin que el nombre del Ni??o es Grogu, y que fue sacado del Templo Jedi y escondido despu??s del final de las Guerras Clon, tras lo cual recuerda muy poco. Ahsoka le explica la Fuerza al Mandaloriano, y deciden dejar dormir a Grogu.\r\n\r\nA la ma??ana siguiente ella decide ver como de entrenado se encuentra Grogu, pero ??ste no se muestra cooperativo, hasta que Din Djarin le ense??a su bolita de metal, la cual atrae con la fuerza. Ahsoka tras ver lo muy apegado que se encuentra a Mando, al ver la relaci??n padre e hijo que tienen, decide no entrenarlo para no repetir el error que ocurri?? con Anakin: \"Su apego a ti lo hace vulnerable a sus miedos. S?? lo que esos sentimientos le hacen a un Caballero Jedi, al mejor de nosotros\".\r\n\r\nAun as?? Din decide ayudarla con la magistrada a cambio de entrenar a Grogu, a lo cual ella acepta. Tras liberar la ciudad, Ahsoka se niega de nuevo a entrenarlo y le dice que vaya a Tython, a la piedra de la visi??n, en donde Grogu podr?? comunicarse a trav??s de la Fuerza con otro jedi que quiera entrenarlo, y elegir as?? su destino.','ahsokatano.png'),(9,1,7,'Kuiil','Kuiil es un hombre Ugnaught que trabaj?? para el Imperio Gal??ctico como esclavo contratado, utilizado por sus habilidades artesanales y mec??nicas. Tras ganarse la libertad sirviendo durante muchos a??os, Kuiil se aventur?? en el lejano planeta des??rtico de Arvala-7 para trabajar en soledad como agricultor de humedad.\r\n\r\nTras encontrarse con el mandaloriano Din Djarin y ver que estaba siendo atacado por dos blurrgs, decidi?? rescatarlo y llevarlo a su granja de humedad. All?? le comenta como muchos m??s cazarrecompensas han ido al valle rompiendo la paz que hab??a en busca de la misma presa que tiene Djarin.\r\nTras ayudarlo a cambio de un blurrg capturado, y ense??arle a montar a la criatura, Kuiil lo lleva al campamento en donde se encuentra la presa, confiando en que podr??a traer de nuevo la paz a su valle.\r\n\r\nUn tiempo despu??s, Djarin regres?? a la granja de Kuiil tras haber recuperado con ??xito su recompensa y le explic?? que su nave, el Razor Crest, hab??a sido saqueada por los Jawas locales. Kuiil se sorprendi?? al ver que Din Djarin estaba vivo y que Grogu era el causante de todos los problemas de los cazarrecompensas. Kuiil accedi?? a ayudar a Djarin a recuperar las partes robadas de su nave y sugiri?? que Djarin intentara comerciar con los Jawas en lugar de luchar contra ellos.\r\n\r\nTiempo despu??s, repara al droide asesino IG-11 volvi??ndolo servicial. Cuando juntos intentan rescatar a Grogu de los Stormtroopers, Kuiil es asesinado mientras estaba en un speeder escapando con el ni??o.\r\n\r\nNo le import?? dar su vida ni poder disfrutar m??s de su jubilaci??n con tal de proteger al Ni??o y a Mando, aun habi??ndolos conocido recientemente. Por esto, por su gran honor y su lealtad se gan?? el coraz??n de todos los fans de la saga, dej??ndonos grandes lecciones de vida.\r\n\"He hablado\".','kuiil.png'),(10,1,7,'Ig-11','Es un droide asesino de Serie IG el cual trabaj?? como cazarrecompensas durante la era de la Nueva Rep??blica.\r\n\r\nIG-11 fue enviado al planeta Arvala-7 para eliminar a una amenaza para el Imperio. El Mandaloriano, tambi??n fue enviado para traer vivo a esa amenaza. Cuando finalmente se encontraron en el planeta, Mando e IG-11 fueron acorralados por mercenarios, quienes intentaron asesinarlos. Cuando IG-11 intent?? activar su autodestrucci??n como ??ltimo recurso, Mando logr?? convencerlo para que continuase luchando. Al entrar donde estaba el objetivo, IG-11 levant?? su blaster para matarlo, pero fue Djarin quien le dispar?? a ??l con el fin de rescatar al Ni??o.\r\n\r\nEl cuerpo del droide fue restaurado por Kuiil, quien consigui?? reparar a IG-11, d??ndole una nueva personalidad, de cuidador y leal.\r\n\r\nCuando dos Stormtroopers raptaron a Grogu, IG-11 se present?? ante ellos como el droide nodriza del Ni??o, y tras asesinarlos, rescat?? al Ni??o. Mientras intentaban escapar de las tropas de Moff Gideon, Mando fue mortalmente herido, por lo que cuando nadie m??s estaba viendo, IG-11 le indic?? que se quitara el casco, con el fin de continuar su misi??n de proteger y cuidar. Le dijo que el credo indicaba que ninguna forma de vida pod??a verle el rostro, y ??l no era un ser vivo. Entonces, al quitarse Djarin el casco, el droide le aplic?? un gel de bacta que san?? sus heridas al instante.\r\n\r\nMientras estaban por las alcantarillas de Nevarro, IG-11 decidi?? que la ??nica manera de proteger a Grogu era sacrificarse. Le dijo a Mando que no llorase por ??l, ya que as?? podr??a cumplir con su misi??n de protegerlos. Acto seguido, el droide empez?? a caminar sobre la lava, lo cual comenz?? a da??ar sus circuitos. Cuando finalmente lleg?? con los imperiales que esperaban a Mando y Grogu para tenderles una emboscada, activ?? su autodestrucci??n.','ig-11.png'),(11,1,7,'Grogu','Tambi??n conocido como el Ni??o, es un ser sensible a la Fuerza y de la misma especie que Yoda, buscado por el gremio de cazarrecompensas en nombre del remanente imperial.\r\n\r\nNaci?? alrededor de 41 a??os antes de la batalla de Yavin. Se cri?? en el templo Jedi de Coruscant y fue entrenado por varios Jedi antes de sobrevivir a la Orden 66. Desde entonces, Grogu fue llevado a la clandestinidad, y se vio obligado a ocultar sus habilidades de la Fuerza para sobrevivir.\r\n\r\nCon una recompensa puesta sobre su cabeza por un agente imperial conocido como \"El Cliente\", Din Djarin e IG-11 consiguen entrar a la guarida de mercenarios, y sorprendidos por encontrar a un beb??, ya que fueron dichos de que el objetivo ten??a 50 a??os, IG-11 le indica a Djarin que las diferentes especies envejecen de una manera distinta, y quiz??s el Ni??o podr??a vivir durante siglos.\r\nRecordando Mando que ??l tambi??n fue un hu??rfano rescatado por los mandalorianos de la destrucci??n de los droides del C.I.S, mat?? a IG-11 y llev?? al ni??o en su nave de vuelta al cliente.\r\n\r\nAll?? Grogu se queda con la bolita met??lica de la palanca de la nave que le encant??. Tras entregar Mando al Ni??o, y volver a su nave en donde vi?? la bolita met??lica, decide volver para rescatarlo de su cruel final.\r\n\r\nA lo largo del camino crean un v??nculo irrompible, convirti??ndose en padre e hijo sin saberlo.\r\nLa Armera le dice que su misi??n es entregarlo con los suyos, con los jedi, y que ese era el camino. Tras encontrarse a Bo-Katan, Ahsoka y por ??ltimo tras rescatar a Grogu del moff Gideon, aparece Luke skywalker quien no solo los salv??, sino se llev?? a Grogu para entrenarlo y protegerlo con su vida.\r\n\r\nEl credo de Din le imped??a bajo ning??n concepto quitarse el casco aunque la vida le dependiera de ello, y Din Djarin lo cumpl??a a raja tabla, hasta el momento en que Grogu fue capturado y tuvo que quit??rselo para dar con las coordenadas de la nave del secuestrador, el moff Gideon. Luego en la despedida entre Grogu y Din, al no haber visto nunca el rostro de su \"padre\", Djarin se quita el casco delante de todos, sin importarle, con tal de despedirse de Grogu, y con l??grimas en los ojos se lo entrega a Luke. Otra de las escenas m??s emotivas de toda la saga.','grogu.png'),(12,1,7,'Cara Dune','Carasynthia Dune, m??s conocida como Cara Dune, es una guerrera y tiradora proveniente de Alderaan. Es una de las mejores amigas de Din Djarin.\r\n\r\nCara Dune luch?? como una soldado de choque para la Alianza Rebelde, hasta que se retir?? y se convirti?? en mercenaria. Encontr?? su camino en un mundo atrasado llamado Sorgan, el cual ten??a una fuerte opresi??n imperial. Eventualmente se encontr?? con el mandaloriano y Grogu, al principio creyendo que ??ste hab??a venido a cobrar una recompensa por ella, aunque al final result?? que la iba a terminar ayudando a liberar el planeta, planeando un ataque secreto con ayuda de los habitantes.\r\n\r\nM??s tarde se volvi?? a encontrar con Mando, cuando este solicit?? su presencia en el planeta Arvala-7, con el fin de reclutar al ugnaught Kuill para cuidar al Ni??o, mientras ellos se encargaban de derrocar el r??gimen del Cliente en el planeta Nevarro. En el momento en que ambos amigos se saludaron, el Ni??o ahorc?? con la Fuerza a Cara Dune creyendo que le estaba haciendo da??o a Mando, descubriendo as?? el verdadero poder que pod??a alcanzar el Ni??o.\r\n\r\nTras conseguir escapar de la emboscada que les prepara Gideon en el planeta Nevarro, en donde IG-11 da su vida para salvarlos, se despiden Greef, Cara y Mando, el cual se va en su mochila propulsora con el Ni??o hacia su nave.\r\n\r\nM??s adelante la vemos con el cargo de mariscal en Nevarro, y ayuda a Djarin a rescatar a Migs Mayfeld el cual les pod??a obtener de alguna forma las coordenadas del crucero de Gideon, para salvar a Grogu.','caradune.png'),(13,1,7,'Greef karga','Karga es un hombre que fue magistrado, convirti??ndose m??s tarde en el l??der del Gremio de Cazarrecompensas, localizado en Nevarro.\r\n\r\nTiene poca consideraci??n por la moral o la vida de otra persona pero eso no le impide tener algunos principios, aunque ego??stas ya que cuando Mando rompi?? el c??digo del gremio para salvar al Ni??o, Karga trat?? de matarlo, a pesar de todas las veces que Mando hizo un buen trabajo para ??l. Cuando se ali?? con Mando para derribar al Cliente, Karga hab??a planeado traicionarlo, pero tras esa noche tras casi perder la vida, y ser salvado por el Ni??o gracias a la Fuerza, desvela su plan ali??ndose con Mando y Cara para derrocar al remanente imperial y liberal a la ciudad del planeta Nevarro. \"El plan era asesinarte y tomar al ni??o. Pero despu??s de lo que pas?? anoche, no pude seguir con el plan. Adelante, puedes dispararme aqu?? y ahora. No violar??a el c??digo. Pero si lo haces, el ni??o nunca estar?? a salvo\".\r\n\r\nUna vez derrotado el enemigo, Karga se mostr?? agradecido e incluso ofreci?? a Mando volver al gremio.','karga.png');
/*!40000 ALTER TABLE `publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,'user1','[\"ROLE_USER\",\"ROLE_WRITTER\"]','$2y$13$DR1lkfPx1Hb19mgWjL2RYeOgFuHenm8.iGGIEsdrK2kEflJGOH3s.','user1','user1','mando.mandopedia@gmail.com','/img/defaultProfile.png',1),(8,'admin','[\"ROLE_USER\",\"ROLE_WRITTER\",\"ROLE_ADMIN\"]','$2y$13$I.muCfDQ50/xd6VBkPpq8.eYajKAsxL1TGWW1HS8bR1XNwfmPkvY2','admin','admin','mando.mandopedia@gmail.com','/database-img/IMG-0116-2-62a267e577eb3.jpg',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-10 23:13:01
