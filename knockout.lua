game.Players.LocalPlayer.CharacterAdded:Connect(function() task.wait(2)
  if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HitBox") then
      local lastPos = game.Players.LocalPlayer.Character.HitBox.CFrame
      local WC = game.Players.LocalPlayer.Character:FindFirstChild("HitBox").WeldConstraint
      local cloneOf_WC = WC:Clone()
      WC:Destroy()
      local pushtbl = {}
      for i,v in pairs(game.Players:GetPlayers()) do
          if v ~= game.Players.LocalPlayer and v.Character and game.Players.LocalPlayer.Character and v.Character:FindFirstChild("HitBox") and game.Players.LocalPlayer.Character:FindFirstChild("HitBox") then
              table.insert(pushtbl, v)
              task.spawn(function()
                  while v ~= game.Players.LocalPlayer and v.Character and game.Players.LocalPlayer.Character and v.Character:FindFirstChild("HitBox") and game.Players.LocalPlayer.Character:FindFirstChild("HitBox") and v.Character.HumanoidRootPart.Velocity.Magnitude < 1 do
                      task.wait(0.001)
                  end
                  table.remove(pushtbl, table.find(pushtbl, v))
              end)
          end
      end
      while #pushtbl ~= 0 do
          for _,v in pushtbl do
              for _ = 1, 10 do
                  if not (v and v.Character and game.Players.LocalPlayer.Character and v.Character:FindFirstChild("HitBox") and game.Players.LocalPlayer.Character:FindFirstChild("HitBox")) then break end
                  game.Players.LocalPlayer.Character.HitBox.CFrame = v.Character.HitBox.CFrame
                  game.Players.LocalPlayer.Character.HitBox.Velocity = Vector3.new(500,500,500)
                  task.wait()
              end
          end
      end
      game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lastPos
      task.wait(0.1)
      for _ = 1, 20 do
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HitBox") then
            game.Players.LocalPlayer.Character.HitBox.Velocity = Vector3.zero
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lastPos
            game.Players.LocalPlayer.Character.HitBox.CFrame = lastPos
            cloneOf_WC.Parent = game.Players.LocalPlayer.Character.HitBox
        end
        task.wait()
      end
  end
end)
