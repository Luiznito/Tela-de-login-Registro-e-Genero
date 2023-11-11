// Tela de Login/Registro e Genero, feito por Tochi_ 
// GitHub: https://github.com/Luiznito
// Discord: atumzinn


#include <a_samp>
#include <sscanf2>
#include <DOF2>
#include <zcmd>
#include <streamer>

#define Dialog_Login 			1
#define Dialog_Registro 		2
#define Dialog_Genero 			3

enum pInfo
{
	senha,
	genero, 
	dinheiro,
	skin,
	pLogado
}

new pDados[MAX_PLAYERS][pInfo];
new ErrouSenha[MAX_PLAYERS];

main()
{
	print("\n----------------------------------");
	print("   Servidor iniciado com sucesso    ");
	print("----------------------------------\n");
}

public OnGameModeInit()
{
	return 1;
}

public OnGameModeExit()
{
	DOF2_Exit();
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	if(DOF2_FileExists(Arquivo(playerid)))
	{
		ShowPlayerDialog(playerid, Dialog_Login, DIALOG_STYLE_PASSWORD, "Logando-se", "Coloque sua senha para logar", "Entrar", "Sair");
	}
	else
	{
		ShowPlayerDialog(playerid, Dialog_Registro, DIALOG_STYLE_PASSWORD, "Registrado-se", "Coloque sua senha para ser registrar", "Entrar", "Sair");
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(DOF2_FileExists(Arquivo(playerid)))
	{
		DOF2_SetInt(Arquivo(playerid), "dinheiro", GetPlayerMoney(playerid));
		DOF2_SetInt(Arquivo(playerid), "skin", GetPlayerSkin(playerid));
	}
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == Dialog_Registro)
	{
		if(response)
		{
			if(strlen(inputtext) == 0)
			{
				ShowPlayerDialog(playerid, Dialog_Registro, DIALOG_STYLE_PASSWORD, "Registrado-se", "Nao da para criar uma conta sem nenhuma senha", "Entrar", "Sair");
			}
			if(strlen(inputtext) <= 3 || strlen(inputtext) >= 17)
			{
				ShowPlayerDialog(playerid, Dialog_Registro, DIALOG_STYLE_PASSWORD, "Registrado-se", "Sua senha tem que conter de 3 a 17 carecteres", "Entrar", "Sair");
			}
			GivePlayerMoney(playerid, 10000);
			DOF2_CreateFile(Arquivo(playerid));
			DOF2_SetString(Arquivo(playerid), "senha", inputtext);
			DOF2_SetInt(Arquivo(playerid), "dineiro", 10000);
			DOF2_SetInt(Arquivo(playerid), "skin", 0);
			DOF2_SetInt(Arquivo(playerid), "genero", 0);
			DOF2_SaveFile();
			ShowPlayerDialog(playerid, Dialog_Genero, DIALOG_STYLE_LIST, "Escolha seu genero", "Masculino \n Feminino","Confirmar", "Sair");
		}
		else
		{
			Kick(playerid);
		}
	}
	if(dialogid == Dialog_Genero)
	{
		if(response)
		{
			if(listitem == 0)//Masculino
			{
				DOF2_SetInt(Arquivo(playerid), "skin", 26);
				DOF2_SetInt(Arquivo(playerid), "genero", 1);
				pDados[playerid][genero] = 1;
				pDados[playerid][skin] = 26;
				DOF2_SaveFile();
				ShowPlayerDialog(playerid, Dialog_Login, DIALOG_STYLE_PASSWORD, "Logando-se", "Coloque sua senha para logar", "Entrar", "Sair");
			}
			if(listitem == 1)//Feminino
			{
				DOF2_SetInt(Arquivo(playerid), "skin", 12);
				DOF2_SetInt(Arquivo(playerid), "genero", 2);
				pDados[playerid][genero] = 2;
				pDados[playerid][skin] = 12;
				DOF2_SaveFile();
				ShowPlayerDialog(playerid, Dialog_Login, DIALOG_STYLE_PASSWORD, "Logando-se", "Coloque sua senha para logar", "Entrar", "Sair");
			}
		}
		else
		{
			Kick(playerid);
		}
	}
	if(dialogid == Dialog_Login)
	{
		if(response)
		{
			if(strlen(inputtext) == 0) 
			{
				ShowPlayerDialog(playerid, Dialog_Login, DIALOG_STYLE_PASSWORD, "Logando-se", "Coloque sua senha para logar", "Entrar", "Sair");
			}

			if(strcmp(inputtext, DOF2_GetString(Arquivo(playerid), "senha")) == 0)
			{
				CarregarLogin(playerid);
				SetSpawnInfo(playerid, 0, pDados[playerid][skin], 2022.3650,1916.2463,12.3319,269.3945,0,0,0,0,0,0);
				GivePlayerMoney(playerid, pDados[playerid][dinheiro]);
				SpawnPlayer(playerid);
				pDados[playerid][pLogado] = 1;
			}
			else
			{
				if(ErrouSenha[playerid]== 0)
				{
				    ShowPlayerDialog(playerid, Dialog_Login, DIALOG_STYLE_PASSWORD, "Logando-se", "Coloque sua senha para logar", "Entrar", "Sair");
					ErrouSenha[playerid] = 1;
					return 1;
				}
				if(ErrouSenha[playerid]== 1)
				{
				    ShowPlayerDialog(playerid, Dialog_Login, DIALOG_STYLE_PASSWORD, "Logando-se", "Coloque sua senha para logar", "Entrar", "Sair");
					return 1;
				}
				if(ErrouSenha[playerid]== 2)
				{
				    ShowPlayerDialog(playerid, Dialog_Login, DIALOG_STYLE_PASSWORD, "Logando-se", "Coloque sua senha para logar", "Entrar", "Sair");
					return 1;
				}
				if(ErrouSenha[playerid]== 3)
				{
				    Kick(playerid);
					return 1;
				}
			}
		}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
stock pName(playerid)
{
	new Name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, Name, MAX_PLAYER_NAME);
	return Name;
}
stock Arquivo(playerid)
{
	new str[100];
	format(str, 100, "Contas/%s.ini", pName(playerid));
	return str;
}
stock CarregarLogin(playerid)
{
	pDados[playerid][dinheiro] = DOF2_GetInt(Arquivo(playerid), "dinheiro");
	pDados[playerid][skin] = DOF2_GetInt(Arquivo(playerid), "skin");
	return 1;
}