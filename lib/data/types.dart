enum AppInitializerStep {
  STEP_1,
  STEP_2,
  STEP_3,
  STEP_4,
}

enum AppInitializerProcessState {
  notLocationPermission,
  setLocale,
}

enum LoginEventState {
  ok,
  notId,
  wrongPassword,
}

enum ButtonType {
  oneButton,
  twoButton,
}

///주소타입
enum AddressType {
  ///지명
  REGION,

  ///(도로명)
  ROAD,

  ///(지번 주소)
  REGION_ADDR,

  ///(도로명 주소)
  ROAD_ADDR,

  ///
  UNKNOWN
}
