<template>
<div class="container">
  <div class="profile-container">
      <h4>My Profile: {{ user.username }}</h4>

      <hr/>

      <button v-on:click="logout()" class="btn btn-danger">Logout</button>
  </div>
</div>
</template>

<script>
export default {
  name: 'Profile',
  data () {
    return {
      user: {},
      accessToken: null,
      error: null
    }
  },
  created: function() {
    this.user = this.$cognitoAuth.getCurrentUser();
    this.$cognitoAuth.getIdToken((err, result) => {
      if (err) {
        this. error = err
      } else {
        this.accessToken = result
      }
    })
  },
  methods: {
      logout: function() {
          this.$cognitoAuth.logout()
          this.$router.push({path: '/'})
      }
  }
}
</script>

<style scoped>
.profile-container{
  width: 100%;
  height: auto;
  background-color: white;
  border-radius: 5px;
  padding: 20px;
  margin: auto;
  margin-top: 60px;
  border: 1px solid #E4E6E7;
  box-shadow: 0px 2px 5px rgba(0,0,0,0.4);
}
.profile-container h4 {
  font-size: 22px;
  margin: 0;
  padding: 0;
}
</style>