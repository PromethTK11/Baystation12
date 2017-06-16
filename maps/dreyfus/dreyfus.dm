#if !defined(USING_MAP_DATUM)

	#include "dreyfus-01.dmm" // - Sotano - IA y Cyborgs
	#include "dreyfus-02.dmm" // - Ingeniería - Motor. Soporte vital.
	#include "dreyfus-03.dmm" // - Cargo - Cargo, Minería, I+D, Robotica
	#include "dreyfus-04.dmm" // - Residencial - Medbay, cafetería, gimnasio y otras cosas
	#include "dreyfus-05.dmm" // - Oficinas - Zona administrativa y seguridad
	#include "dreyfus-06.dmm" // - Cupula - Jardines y recepcion de invitados
	#include "dreyfus-07.dmm"
	#include "dreyfus-08.dmm"

	#include "../shared/exodus_torch/_include.dm"

	#include "dreyfus_areas.dm"
	#include "dreyfus_elevator.dm"
	#include "dreyfus_ranks.dm"
	#include "dreyfus_presets.dm"
	#include "dreyfus_shuttles.dm"
	#include "dreyfus_effects.dm"


	//CONTENT
	#include "job/jobs.dm"
	#include "datums/uniforms.dm"
	#include "items/storage.dm"
	#include "items/cards_ids.dm"
	#include "items/papers.dm"
	#include "structures/airlock.dm"
	#include "structures/blast_door.dm"
	#include "structures/closet.dm"
	#include "structures/curtains.dm"
	#include "structures/flooring.dm"
	#include "structures/flooring_decals.dm"
	#include "structures/flooring_premades.dm"
	#include "structures/furniture.dm"
	#include "structures/gym.dm"
	#include "structures/tile_types.dm"
	#include "structures/wall_icons.dm"
	#include "structures/walls.dm"
	#include "structures/machinery.dm"

	#include "../shared/exodus_torch/_include.dm"

	// Can I ask why are we importing several objects with information for lobby music separated into various archives?
	// Why not just a "../../code/modules/lobby_music/lobby_music.dm" with all the info in it? - Sansaur
	#include "../../code/modules/lobby_music/absconditus.dm"
	#include "../../code/modules/lobby_music/clouds_of_fire.dm"
	#include "../../code/modules/lobby_music/endless_space.dm"
	#include "../../code/modules/lobby_music/dilbert.dm"
	#include "../../code/modules/lobby_music/space_oddity.dm"
	#include "../../code/modules/lobby_music/hardcorner.dm"
	#include "../../code/modules/lobby_music/spessbenzaie.dm"
	#include "../../code/modules/lobby_music/moonsoon.dm"
	#include "../../code/modules/lobby_music/bestfriends.dm"
	#include "../../code/modules/lobby_music/soma.dm"
	#include "../../code/modules/lobby_music/chasing_time.dm"
	#include "../../code/modules/lobby_music/Torch.dm"


	#define USING_MAP_DATUM /datum/map/dreyfus

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Dreyfus
#endif
