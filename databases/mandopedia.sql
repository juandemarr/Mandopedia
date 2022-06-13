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
INSERT INTO `publication` VALUES (1,1,7,'Din Djarin','Din Djarin, conocido como "el Mandaloriano" o "Mando", fue un hombre humano mandaloriano que trabajó como cazarrecompensas durante la Era de la Nueva República.\r\n\r\nEn su juventud, Din Djarin vivió con sus padres en un planeta no identificado que fue víctima de un ataque separatista en el que sus padres perdieron la vida protegiéndolo. Un superdroide de batalla lo sacó y lo habría matado sin la intervención de Death Watch. Este trágico acontecimiento permaneció en su memoria años más tarde.\r\n\r\nTiempo después, se unió a un clan mandaloriano llamado \"La Tribu\", asentado en un mundo volcánico. Cuando tuvo la edad suficiente, Din prometió lealtad al credo mandaloriano, convirtiéndose así en uno de los suyos y adquiriendo armaduras y armas de su nuevo pueblo, antes de unirse al gremio de cazadores de recompensas.\r\n\r\nMando respeta profundamente el credo de Mandalore, al igual que las reglas de la Tribu, es decir: nunca se quitará el casco delante de un ser vivo, aunque esa vida dependa y le impida a alguien hacerlo.\r\n\r\nDebido a que él mismo ha sido huérfano, parece tener una profunda simpatía por los demás huérfanos y esta misma simpatía se extiende también a \"El Niño\" que inicialmente fue un objetivo para él. Se ve la transformación de cómo primero cuida solo de la seguridad de El Niño para conseguir su pago, hasta arriesgar su vida para salvarlo, traicionando al gremio de cazarrecompensas, y desobedeciendo las mismísimas reglas de Los Hijos de la Guardia, las cuales han regido su vida y definido su moral, solo para poder salvar al Niño y verlo otro día más.','mando.jpg'),(2,1,7,'La Armera','Durante la época de la Nueva República, la armera era miembro de la Tribu y su líder, los cuales residían en un enclave mandaloriano en el planeta volcánico Nevarro. Debido a la Gran Purga perpetuada por el Imperio Galáctico contra los mandalorianos, la Tribu se vio obligada a permanecer oculta en dicho enclave.\r\n\r\nLa Armera forjó a petición de Din Djaron una hombrera de béskar puro, a partir de una tablilla del mismo material obtenida por éste como anticipo a la caza del activo: el Niño. \"Ésto fue obtenido en la Gran Purga, es bueno que vuelva a la Tribu\".\r\nTras entregar Din Djarin el Niño al remanente imperial y cumplir con su contrato, le pide forjar una coraza de beskar con el cargamento obtenido. Le dice que lo restante de béskar sea entregado a los huérfanos como ayuda económica, a lo que responde la Armera:  \"Los huérfanos son el futuro, éste es el camino\".\r\n\r\nTras rescatar Din Djarin al Niño de los imperiales conociendo que le aguardaba un corto futuro lleno de experimentos al poseer éste la fuerza, lo lleva ante La Armera, quien le explica cómo eones atrás los mandalorianos lucharon contra una orden de magos llamados \"jedi\". En ese momento, La Armera le forja un cuerno de barro, el símbolo del animal que tenía que matar Mando en un contrato, y del que fue salvado gracias al Niño. \"Ahora sois un clan de dos\".\r\nTambién le forja \"pájaros silbadores\", una arma efectiva contra múltiples enemigos, y una mochila propulsora, tendiendo así Mando su equipo completo.\r\nLe encomendó a Djarin la misión de entregar al Niño a los de su especie, y mientras no estuviera con ellos, estaría bajo su protección.\r\n\r\nMás tarde, tras estos acontecimientos, queda revelada la posición del enclave al Imperio, quienes no dudan en masacrar a los pocos mandalorianos que había.\r\nEllos tienen que huir del planeta, pero la Armera se queda, para enfentrarse a tantos imperiales como pueda, y vengar a su clan asesinado.','armorer.png'),(3,2,7,'Bo-Katan','Bo-Katan Kryze es una mandaloriana de raza humana, quien antaño fuera hermana de la duqesa Satine Kryze, y lider de los mandalorianos durante la Gran Purga hecha por el Imperio para aniquilar a su raza. \r\n\r\nMucho más tarde de estos acontecimientos, se encontraría con Din Djarin en Trask, donde había sido atacado por piratas quarren que intentaron matarlo a él y al Niño para robar su armadura. Bo-Katan y su escuadrón los rescataron, pidiéndole que los ayudara a robar armas y suministros imperiales a cambio de ayuda para encontrar al Jedi a quien devolverle el Niño. Al principio, Din Djarin se molestó cuando Bo-Katan se quitó el casco, creyendo que no era mandaloriana. Sin embargo, esto resultó ser la norma para la mayoría de los mandalorianos, ya que se sorprendió al saber que era parte de una secta que se separó de la sociedad mandaloriana dominante a favor de las viejas costumbres. Djarin estuvo de acuerdo y procedió a ayudarlos a tomar el barco de transporte. Una vez allí, Bo-Katan le preguntó al capitán por la ubicación del moff Gideon para recuperar su sable oscuro, pero sin éxito al suicidarse éste.\r\n\r\nBo-Katan trató de convencer a Djarin para que se uniera a ella, pero éste le dijo que tenía que seguir con su búsqueda. Entendiéndolo, Bo-Katan le dijo que buscara a Ahsoka Tano en la ciudad de Calodan en el mundo forestal de Corvus.\r\n\r\nAlgún tiempo después, Din Djarin la buscó y se solicitó ayudar para recuperar a Grogu (El Niño) de las garras de Gideon. Al principio se negó, pero cambió de paracer al saber que Djarin tenía las coordenadas del crucero de Gideon. Le pidió al moff para recuperar el sable oscuro, y el crucero para la reconquista de Mandalore, a lo que Mando respondió \"Ayúdame a encontrar al Niño y tendrás todo lo que quieras, él es mi única prioridad\".\r\n\r\nTras estos acontencimientos, los planes de Bo-Katan se vieron fustrados al encontrarse Mando con Gideon, y obtener el sable tras luchar con él y salvar a Grogu. Como más tarde explica el moff, el sable oscuro solo puede ganarse en batalla, como parte de la tradición para poder gobernar Mandalore, por lo que Bo no pudo aceptárselo a Din Djarin.','bo-katan.png'),(4,2,7,'Moff Gideon','Humano que lideró uno de los remanentes imperiales que surgieron tras la destrucción de la Segunda Estrella de la Muerte, y la derrota del Imperio en la Guerra Civil Galáctica.\r\n\r\nDespués de esta guerra, se pensó que había sido ejecutado por cometer una serie de crímenes de guerra, pero se descubrió que fingió su propia muerte y creó en secreto un pequeño ejército imperial. Poco después, Gideon robó el legendario sable de luz mandaloriano, conocido como sable oscuro, de su legítimo dueño Bo-Katan Kryze, y supervisó la Gran Purga, un ataque imperial en Mandalore que dejó el planeta inhabitable.\r\n\r\nTras la destrucción de la segunda Estrella de la Muerte, Gideon comenzó a participar en los intentos de crear clones que pudieran diseñarse para tener poderes de la Fuerza. Para lograr este fin, buscó obtener al bebé sensible a la Fuerza conocido como Grogu, y usar su sangre la cual tenía una concentración extremadamente alta de midiclorianos.\r\n\r\nEra frío, calculador y brutal, de hecho ejecutó a uno de sus hombres por interrumpirlo sin querer.\r\nCuando Din Djarin lo expulsó del planeta Nevarro junto al resto de fuerzas remanentes imperiales, se convirtió en algo personal para Gideon, quien comenzó a supervisar el desarrollo de una tercera generación de Dark Troopers, la cual empezó siendo un pesado traje de soldado de asalto hasta eliminar por completo al humano que había dentro y convertirse en droides.\r\n\r\nTambién era extremadamente inteligente calculando los pasos de sus enemigos, y se enfrentó a Din Djarin cuando invadieron su crucero él, Fennec Shand, Bo-Katan y Cara Dune al rescate de Grogu, para evitar pelear con Bo-Katan, y en caso de perder que ella no pudiese portar el sable oscuro, al poder ser éste sólo llevado por quien lo ganase en combate.','gideon.png'),(5,2,7,'Luke Skywalker','Fue un Jedi masculino humano que creció en Tatooine.\r\nDespués de crecer, eventualmente se convirtió en parte de la lucha contra el Imperio Galáctico, teniendo un papel clave en su caída en el 4 DBY. No está claro qué hizo después, pero en algún momento del 9 DBY, Grogu se puso en contacto con él mientras meditaba en unas ruinas rocosas en Tython, en busca de un compañero usuario de la fuerza.\r\n\r\nNo mucho después, Luke pudo localizar al niño en el crucero ligero de Gideon. Llegó al crucero en su caza X-wing y destruyó a todos los Soldados Oscuros en la nave mientras se dirigía a la sala de control.\r\n\r\nGrogu sintió su llegada a través de la fuerza, y estando todos (Din Djarin, Grogu, Bo-Katan, Koska Reeves, Cara Dune y Fennec Shand) a punto de morir a manos de los Dark Troopers, Luke los salvó como hizo antaño con los miembros de la rebelión, y trayendo de vuelta al lado luminoso a su padre, Darth Vader.\r\n\r\nAllí acordó con Din Djarin que tomaría a Grogu como su aprendiz y prometió protegerlo con su vida.\r\n\r\nEsta fue sin duda una de las escenas más emotivas y esperadas por todo el fandom de Star Wars, al traer de vuelta al Luke conocidos por todos, el que arriesga su vida, con tal de poder salvar a todos los que pueda, sin importarle el costo de tales actos. Un broche de oro para una de las mejores series de esta nuestra querida galaxia.','luke.png'),(6,2,7,'Boba Fett','Boba Fett es un clon de Jango Fett, el único clon inalterado tratado como hijo por Jango.\r\n\r\nTras los acontecimientos de las películas, Boba escapó del Sarlacc con vida, y tiempo después encontró a Fennec Shand dejada a su suerte en las arenas de Tattoine.\r\nConsiguió que la salvasen, y después le ofreció trabajo para luchar juntos, a lo que ella accedió.\r\n\r\nDespués Boba Fett y Fennec Shand fueron a Tython como amigos para encontrarse con Din. Él quería recuperar su armadura, la cual estaba en el interior del Razor Crest. A cambio de ella Boba le prometió a Din que cuidarían de Grogu, a lo que éste accedió. Tras luchar con los soldados de asalto y perder a Grogu por los soldados oscuros que lo capturaron, Boba le mostró a Din un holograma que decía que la armadura de Jango le pertenecía a su padre y éste se la dió. Cumpliendo con su trato, Boba usó el Esclavo 1 para llevar a Din e idear un plan de rescate.\r\n\r\nPrimero había que hacerse con las coordenadas del crucero del moff, yendo Din y Migs Mayfeld a la refinería imperial en Morak, en donde las obtuvieron y fueron evacuados por Boba.\r\nTras ello, le pidieron ayuda a Bo-Katan, capturaron al doctor Pershing e idearon un plan para hacerse con el crucero de Gideon.\r\n\r\nEste plan consistía en que Bo-Katan, Cara Dune, Fennec Shand y Koska Reeves irían en el transbordador imperial enviando una señal de socorro por los disparos del Esclavo 1.\r\nCuando el grupo salió del hiperespacio, ejecutaron su plan permitiendo al transbordador entrar en el crucero. Una vez allí, Fett se dispuso a atacar a los cazas TIE antes de saltar al hiperespacio, dejando que el equipo de infiltración terminara la misión.','boba.png'),(7,1,7,'Fennec Shand','Fennec era un nuevo miembro del Gremio de Cazarrecompensas durante el Imperio. Ahora, una temida asesina que trabajaba durante la era de la Nueva República, Fennec permaneció escondida en el planeta Tatooine después del arresto de sus empleadores.\r\nAllí, se cruzaría con Din Djarin, quien acordó trabajar junto al novato Toro Calican en su caza de Fennec Shand, a cambio de dinero para obtener piezas de repuesto para su nave Razor Crest.\r\nAmbos intentan ir a por Fennec, quien teniendo la altura desde una colina, le dispara a Din en su armadura de beskar. Esto hacen que decidan posponer su cacería.\r\n\r\nAl caer la noche y usar unas bengalas flash para cegar a Fennec, consiguen acercarse, pero no sin antes ser destrudio el speeder de Mando por Fennec. Toro llegó por la espalda y le apuntó en la cabeza. Tras tener que ir Mando a por otro bantha para llevársela, Fennec intenta manipular a Toro para trabajar juntos en contra de Mando, quien tenía una recompensa muy alta. Toro decide matarla e ir a por Mando, quien al llegar y darla por muerta ve que Toro le había traicionado. Más tarde lo encuentra y mata.\r\n\r\nTras ésto, Fennec sería rescatada por Boba y decide ser su socia.\r\nAcompañando a Boba a recuperar su armadura de Din en Tython, y tras hacer un trato con éste para devolvérsela a cambio de proteger a Grogu, van al crucero ligero de Gideon, quien capturó al Niño. Allí, lo invaden y junto a Cara Dune, Bo-Katan y Koska Reevs se hacen con el control de la nave, rescatan a Grogu y gracias a la ayuda de Luke Skywalker, consiguen salir con vida del ejército de soldados oscuros.','fennec.png'),(8,2,7,'Ahsoka Tano','Mujer togrutta, padawan de Anakin Skywalker durante las Guerras Clon, que abandonó la Orden Jedi tras ser expulsada de manera injusta, y luego invitada a volver.\r\n\r\nDin Djarin tiene la tarea de llevar a \"El Niño\" a los Jedi, y luego de una misión con Bo-Katan, se dirige a la ciudad de Calodan en Corvus, donde vive Ahsoka.\r\n\r\nAhsoka se ha hecho enemiga de la magistrada corrupta de la ciudad, Morgan Elsbeth, quien trabaja para el Imperio y envía repetidamente a sus tropas para intentar matarla.\r\nDjarin y el Niño llegan un tiempo después y la magistrada le dice que mate a Ahsoka, a cambio, ella le dará su lanza hecha de beskar puro. Djarin y Ahsoka se encuentran y pelean brevemente fuera de la ciudad antes de que Djarin se dirija a ella por su nombre y diga que Bo-Katan lo envió, haciendo que se detenga.\r\n\r\nLos tres acampan y el Niño y Ahsoka se comunican a través de la Fuerza (ya que todavía no puede pronunciar oraciones completas). A través de esto, Ahsoka le revela a Djarin que el nombre del Niño es Grogu, y que fue sacado del Templo Jedi y escondido después del final de las Guerras Clon, tras lo cual recuerda muy poco. Ahsoka le explica la Fuerza al Mandaloriano, y deciden dejar dormir a Grogu.\r\n\r\nA la mañana siguiente ella decide ver como de entrenado se encuentra Grogu, pero éste no se muestra cooperativo, hasta que Din Djarin le enseña su bolita de metal, la cual atrae con la fuerza. Ahsoka tras ver lo muy apegado que se encuentra a Mando, al ver la relación padre e hijo que tienen, decide no entrenarlo para no repetir el error que ocurrió con Anakin: \"Su apego a ti lo hace vulnerable a sus miedos. Sé lo que esos sentimientos le hacen a un Caballero Jedi, al mejor de nosotros\".\r\n\r\nAun así Din decide ayudarla con la magistrada a cambio de entrenar a Grogu, a lo cual ella acepta. Tras liberar la ciudad, Ahsoka se niega de nuevo a entrenarlo y le dice que vaya a Tython, a la piedra de la visión, en donde Grogu podrá comunicarse a través de la Fuerza con otro jedi que quiera entrenarlo, y elegir así su destino.','ahsokatano.png'),(9,1,7,'Kuiil','Kuiil es un hombre Ugnaught que trabajó para el Imperio Galáctico como esclavo contratado, utilizado por sus habilidades artesanales y mecánicas. Tras ganarse la libertad sirviendo durante muchos años, Kuiil se aventuró en el lejano planeta desértico de Arvala-7 para trabajar en soledad como agricultor de humedad.\r\n\r\nTras encontrarse con el mandaloriano Din Djarin y ver que estaba siendo atacado por dos blurrgs, decidió rescatarlo y llevarlo a su granja de humedad. Allí le comenta como muchos más cazarrecompensas han ido al valle rompiendo la paz que había en busca de la misma presa que tiene Djarin.\r\nTras ayudarlo a cambio de un blurrg capturado, y enseñarle a montar a la criatura, Kuiil lo lleva al campamento en donde se encuentra la presa, confiando en que podría traer de nuevo la paz a su valle.\r\n\r\nUn tiempo después, Djarin regresó a la granja de Kuiil tras haber recuperado con éxito su recompensa y le explicó que su nave, el Razor Crest, había sido saqueada por los Jawas locales. Kuiil se sorprendió al ver que Din Djarin estaba vivo y que Grogu era el causante de todos los problemas de los cazarrecompensas. Kuiil accedió a ayudar a Djarin a recuperar las partes robadas de su nave y sugirió que Djarin intentara comerciar con los Jawas en lugar de luchar contra ellos.\r\n\r\nTiempo después, repara al droide asesino IG-11 volviéndolo servicial. Cuando juntos intentan rescatar a Grogu de los Stormtroopers, Kuiil es asesinado mientras estaba en un speeder escapando con el niño.\r\n\r\nNo le importó dar su vida ni poder disfrutar más de su jubilación con tal de proteger al Niño y a Mando, aun habiéndolos conocido recientemente. Por esto, por su gran honor y su lealtad se ganó el corazón de todos los fans de la saga, dejándonos grandes lecciones de vida.\r\n\"He hablado\".','kuiil.png'),(10,1,7,'Ig-11','Es un droide asesino de Serie IG el cual trabajó como cazarrecompensas durante la era de la Nueva República.\r\n\r\nIG-11 fue enviado al planeta Arvala-7 para eliminar a una amenaza para el Imperio. El Mandaloriano, también fue enviado para traer vivo a esa amenaza. Cuando finalmente se encontraron en el planeta, Mando e IG-11 fueron acorralados por mercenarios, quienes intentaron asesinarlos. Cuando IG-11 intentó activar su autodestrucción como último recurso, Mando logró convencerlo para que continuase luchando. Al entrar donde estaba el objetivo, IG-11 levantó su blaster para matarlo, pero fue Djarin quien le disparó a él con el fin de rescatar al Niño.\r\n\r\nEl cuerpo del droide fue restaurado por Kuiil, quien consiguió reparar a IG-11, dándole una nueva personalidad, de cuidador y leal.\r\n\r\nCuando dos Stormtroopers raptaron a Grogu, IG-11 se presentó ante ellos como el droide nodriza del Niño, y tras asesinarlos, rescató al Niño. Mientras intentaban escapar de las tropas de Moff Gideon, Mando fue mortalmente herido, por lo que cuando nadie más estaba viendo, IG-11 le indicó que se quitara el casco, con el fin de continuar su misión de proteger y cuidar. Le dijo que el credo indicaba que ninguna forma de vida podía verle el rostro, y él no era un ser vivo. Entonces, al quitarse Djarin el casco, el droide le aplicó un gel de bacta que sanó sus heridas al instante.\r\n\r\nMientras estaban por las alcantarillas de Nevarro, IG-11 decidió que la única manera de proteger a Grogu era sacrificarse. Le dijo a Mando que no llorase por él, ya que así podría cumplir con su misión de protegerlos. Acto seguido, el droide empezó a caminar sobre la lava, lo cual comenzó a dañar sus circuitos. Cuando finalmente llegó con los imperiales que esperaban a Mando y Grogu para tenderles una emboscada, activó su autodestrucción.','ig-11.png'),(11,1,7,'Grogu','También conocido como el Niño, es un ser sensible a la Fuerza y de la misma especie que Yoda, buscado por el gremio de cazarrecompensas en nombre del remanente imperial.\r\n\r\nNació alrededor de 41 años antes de la batalla de Yavin. Se crió en el templo Jedi de Coruscant y fue entrenado por varios Jedi antes de sobrevivir a la Orden 66. Desde entonces, Grogu fue llevado a la clandestinidad, y se vio obligado a ocultar sus habilidades de la Fuerza para sobrevivir.\r\n\r\nCon una recompensa puesta sobre su cabeza por un agente imperial conocido como \"El Cliente\", Din Djarin e IG-11 consiguen entrar a la guarida de mercenarios, y sorprendidos por encontrar a un bebé, ya que fueron dichos de que el objetivo tenía 50 años, IG-11 le indica a Djarin que las diferentes especies envejecen de una manera distinta, y quizás el Niño podría vivir durante siglos.\r\nRecordando Mando que él también fue un huérfano rescatado por los mandalorianos de la destrucción de los droides del C.I.S, mató a IG-11 y llevó al niño en su nave de vuelta al cliente.\r\n\r\nAllí Grogu se queda con la bolita metálica de la palanca de la nave que le encantó. Tras entregar Mando al Niño, y volver a su nave en donde vió la bolita metálica, decide volver para rescatarlo de su cruel final.\r\n\r\nA lo largo del camino crean un vínculo irrompible, convirtiéndose en padre e hijo sin saberlo.\r\nLa Armera le dice que su misión es entregarlo con los suyos, con los jedi, y que ese era el camino. Tras encontrarse a Bo-Katan, Ahsoka y por último tras rescatar a Grogu del moff Gideon, aparece Luke skywalker quien no solo los salvó, sino se llevó a Grogu para entrenarlo y protegerlo con su vida.\r\n\r\nEl credo de Din le impedía bajo ningún concepto quitarse el casco aunque la vida le dependiera de ello, y Din Djarin lo cumplía a raja tabla, hasta el momento en que Grogu fue capturado y tuvo que quitárselo para dar con las coordenadas de la nave del secuestrador, el moff Gideon. Luego en la despedida entre Grogu y Din, al no haber visto nunca el rostro de su \"padre\", Djarin se quita el casco delante de todos, sin importarle, con tal de despedirse de Grogu, y con lágrimas en los ojos se lo entrega a Luke. Otra de las escenas más emotivas de toda la saga.','grogu.png'),(12,1,7,'Cara Dune','Carasynthia Dune, más conocida como Cara Dune, es una guerrera y tiradora proveniente de Alderaan. Es una de las mejores amigas de Din Djarin.\r\n\r\nCara Dune luchó como una soldado de choque para la Alianza Rebelde, hasta que se retiró y se convirtió en mercenaria. Encontró su camino en un mundo atrasado llamado Sorgan, el cual tenía una fuerte opresión imperial. Eventualmente se encontró con el mandaloriano y Grogu, al principio creyendo que éste había venido a cobrar una recompensa por ella, aunque al final resultó que la iba a terminar ayudando a liberar el planeta, planeando un ataque secreto con ayuda de los habitantes.\r\n\r\nMás tarde se volvió a encontrar con Mando, cuando este solicitó su presencia en el planeta Arvala-7, con el fin de reclutar al ugnaught Kuill para cuidar al Niño, mientras ellos se encargaban de derrocar el régimen del Cliente en el planeta Nevarro. En el momento en que ambos amigos se saludaron, el Niño ahorcó con la Fuerza a Cara Dune creyendo que le estaba haciendo daño a Mando, descubriendo así el verdadero poder que podía alcanzar el Niño.\r\n\r\nTras conseguir escapar de la emboscada que les prepara Gideon en el planeta Nevarro, en donde IG-11 da su vida para salvarlos, se despiden Greef, Cara y Mando, el cual se va en su mochila propulsora con el Niño hacia su nave.\r\n\r\nMás adelante la vemos con el cargo de mariscal en Nevarro, y ayuda a Djarin a rescatar a Migs Mayfeld el cual les podía obtener de alguna forma las coordenadas del crucero de Gideon, para salvar a Grogu.','caradune.png'),(13,1,7,'Greef karga','Karga es un hombre que fue magistrado, convirtiéndose más tarde en el líder del Gremio de Cazarrecompensas, localizado en Nevarro.\r\n\r\nTiene poca consideración por la moral o la vida de otra persona pero eso no le impide tener algunos principios, aunque egoístas ya que cuando Mando rompió el código del gremio para salvar al Niño, Karga trató de matarlo, a pesar de todas las veces que Mando hizo un buen trabajo para él. Cuando se alió con Mando para derribar al Cliente, Karga había planeado traicionarlo, pero tras esa noche tras casi perder la vida, y ser salvado por el Niño gracias a la Fuerza, desvela su plan aliándose con Mando y Cara para derrocar al remanente imperial y liberal a la ciudad del planeta Nevarro. \"El plan era asesinarte y tomar al niño. Pero después de lo que pasó anoche, no pude seguir con el plan. Adelante, puedes dispararme aquí y ahora. No violaría el código. Pero si lo haces, el niño nunca estará a salvo\".\r\n\r\nUna vez derrotado el enemigo, Karga se mostró agradecido e incluso ofreció a Mando volver al gremio.','karga.png');
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
