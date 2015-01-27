namespace cpp funplus.fp1225
namespace csharp Rtm.Connection
namespace php serverGated
namespace go serverGated

/**
 * Standard base service
 */
service FunplusService {

  bool status(),

  /**
   * User friendly description of status, such as why the service is in
   * the dead or warning state, or what is being started or stopped.
   */
  map<string,string> infos(),

  /**
   * Sets an option
   */
  void tune(1: string key, 2: string value),
}
