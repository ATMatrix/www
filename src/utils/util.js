//判断是否手机端访问
export function isMobile() {
  const userAgentInfo = navigator.userAgent.toLowerCase();
  const Agents = ["android", "iphone", "windows phone"];

  return Agents.some(a => userAgentInfo.indexOf(a) > -1);
}

export function verifyMail(mail) {
  const regx = /^([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+.[a-zA-Z]{2,4}$/;

  return regx.test(mail);
}
