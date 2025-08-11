<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Add Policy Holder</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    @keyframes float {
      0% { transform: translateY(0); }
      50% { transform: translateY(-10px); }
      100% { transform: translateY(0); }
    }

    .float-box {
      animation: float 4s ease-in-out infinite;
    }
  </style>
</head>
<body class="bg-gradient-to-r from-blue-100 to-blue-200 min-h-screen flex items-center justify-center">

  <div class="w-full max-w-5xl grid grid-cols-1 md:grid-cols-2 gap-8 p-10 rounded-2xl shadow-2xl bg-white float-box">
    
    <!-- Left Section (Info/Image) -->
    <div class="flex flex-col justify-center items-center text-center">
      <img src="https://cdn-icons-png.flaticon.com/512/9466/9466230.png" class="w-32 h-32 mb-4 hover:scale-110 transition" alt="Add Icon">
      <h2 class="text-4xl font-extrabold text-blue-800 mb-2 hover:scale-105 transition">Add Policy Holder</h2>
      <p class="text-gray-600 max-w-sm">
        Register a new policy holder by filling out the form. All fields are required.
      </p>
    </div>

    <!-- Right Section (Form) -->
    <form action="SubmitAddPolicyHolder" method="post" class="space-y-4">
      <div>
        <label class="block text-sm font-semibold text-blue-900">Email (ID)</label>
        <input type="email" name="email" required
               class="w-full px-4 py-2 rounded-xl border border-blue-300 focus:outline-none focus:ring-2 focus:ring-blue-500 transition" />
      </div>

      <div>
        <label class="block text-sm font-semibold text-blue-900">Name</label>
        <input type="text" name="name" required
               class="w-full px-4 py-2 rounded-xl border border-blue-300 focus:outline-none focus:ring-2 focus:ring-blue-500 transition" />
      </div>

      <div>
        <label class="block text-sm font-semibold text-blue-900">Date of Birth</label>
        <input type="date" name="dob" required
               class="w-full px-4 py-2 rounded-xl border border-blue-300 focus:outline-none focus:ring-2 focus:ring-blue-500 transition" />
      </div>

      <div>
        <label class="block text-sm font-semibold text-blue-900">Contact</label>
        <input type="text" name="contact" required
               class="w-full px-4 py-2 rounded-xl border border-blue-300 focus:outline-none focus:ring-2 focus:ring-blue-500 transition" />
      </div>

      <div>
        <label class="block text-sm font-semibold text-blue-900">Address</label>
        <textarea name="address" rows="3" required
                  class="w-full px-4 py-2 rounded-xl border border-blue-300 focus:outline-none focus:ring-2 focus:ring-blue-500 transition"></textarea>
      </div>

      <div>
        <label class="block text-sm font-semibold text-blue-900">Password</label>
        <input type="password" name="password" required
               class="w-full px-4 py-2 rounded-xl border border-blue-300 focus:outline-none focus:ring-2 focus:ring-blue-500 transition" />
      </div>

      <div class="pt-4">
        <button type="submit"
                class="w-full flex items-center justify-center gap-2 py-2 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-xl transition transform hover:scale-105 duration-300">
          <img src="https://cdn-icons-png.flaticon.com/512/992/992651.png" alt="submit icon" class="w-5 h-5" />
          Add Policy Holder
        </button>
      </div>
    </form>
  </div>

</body>
</html>
