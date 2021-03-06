local MediaPlayerClass = "mediaplayer_tv"

local function AddMediaPlayerModel( spawnName, name, model, playerConfig )
	list.Set( "SpawnableEntities", spawnName, {
		PrintName = name,
		ClassName = MediaPlayerClass,
		Category = "Media Player",
		DropToFloor = true,
		KeyValues = {
			model = model
		}
	} )

	list.Set( "MediaPlayerModelConfigs", model, playerConfig )
end

AddMediaPlayerModel(
	"../spawnicons/models/hunter/plates/plate5x8",
	"Huge Billboard",
	"models/hunter/plates/plate5x8.mdl",
	{
		angle = Angle(0, 90, 0),
		offset = Vector(-118.8, 189.8, 2.5),
		width = 380,
		height = 238
	}
)

AddMediaPlayerModel(
	"../spawnicons/models/props_phx/rt_screen",
	"Small TV",
	"models/props_phx/rt_screen.mdl",
	{
		angle = Angle(-90, 90, 0),
		offset = Vector(6.5, 27.9, 35.3),
		width = 56,
		height = 33
	}
)

-- Сustom

AddMediaPlayerModel(
	"../spawnicons/models/hunter/plates/plate8x16",
	"8x16 Screen",
	"models/hunter/plates/plate8x16.mdl",
	{
		angle = Angle(0, 90, 0),
		offset = Vector(-190, 380, 2),
		width = 760,
		height = 380
	}
)

AddMediaPlayerModel(
	"../spawnicons/models/hunter/plates/plate1x1",
	"1x1 Screen",
	"models/hunter/plates/plate1x1.mdl",
	{
		angle = Angle(0, 90, 0),
		offset = Vector(-23.5, 23.5, 1.8),
		width = 47.5,
		height = 47.5
	}
)

AddMediaPlayerModel(
	"../spawnicons/models/hunter/plates/plate8x24",
	"8x24 Screen",
	"models/hunter/plates/plate8x24.mdl",
	{
		angle = Angle(0, 90, 0),
		offset = Vector(-190, 570,2),
		width = 1140,
		height = 380
	}
)

AddMediaPlayerModel(
	"../spawnicons/models/hunter/plates/plate2x3",
	"2x3 Screen",
	"models/hunter/plates/plate2x3.mdl",
	{
		angle = Angle(0, 90, 0),
		offset = Vector(-47, 70.5, 1.8),
		width = 141,
		height = 94
	}
)

if SERVER then

	-- fix for media player owner not getting set on alternate model spawn
	hook.Add( "PlayerSpawnedSENT", "MediaPlayer.SetOwner", function(ply, ent)
		if not ent.IsMediaPlayerEntity then return end
		ent:SetCreator(ply)
		local mp = ent:GetMediaPlayer()
		mp:SetOwner(ply)
	end )

end
