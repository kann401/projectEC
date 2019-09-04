package global.sesoc.projectEC.dao;

import java.util.ArrayList;

public interface ChartDAO {

	// 각달의 배출량을 구하는 식
	public String getCafegraph9(String loginId);

	public String getCafegraph8(String loginId);

	public String getCafegraph7(String loginId);

	public String getCafegraph6(String loginId);

	public String getCafegraph5(String loginId);

	// 각달의 수거량을 구하는 식
	public String getBusigraph9(String loginId);

	public String getBusigraph8(String loginId);

	public String getBusigraph7(String loginId);

	public String getBusigraph6(String loginId);

	public String getBusigraph5(String loginId);

	// 각달의 전체 배출/수거량을 구하는 식
	public int getAllgraph9();

	public int getAllgraph8();

	public int getAllgraph7();

	public int getAllgraph6();

	public int getAllgraph5();

	// 배출량 상위 3개의 목록을 가져온다.
	public ArrayList<String> getCafescore();
}
