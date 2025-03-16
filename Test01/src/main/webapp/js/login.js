

  /* scripts.js */

// AngularJS 앱 모듈 및 컨트롤러 정의
var app = angular.module('loginApp', []);

app.controller('LoginController', function($scope) {
    // 로그인과 회원가입 폼 전환을 위한 변수
    $scope.showSignIn = false; // 기본값: 로그인 폼 표시

    // 로그인 기능 (현재는 콘솔 출력만 수행)
    $scope.login = function() {
        console.log("로그인 시도:", $scope.email, $scope.password);
        alert("로그인 기능은 아직 구현되지 않았습니다.");
    };

    // 회원가입 기능 (현재는 콘솔 출력만 수행)
    $scope.register = function() {
        console.log("회원가입 시도:", $scope.username, $scope.email, $scope.password);
        alert("회원가입 기능은 아직 구현되지 않았습니다.");
    };
});
 