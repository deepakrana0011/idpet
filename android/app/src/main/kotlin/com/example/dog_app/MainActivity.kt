package com.example.dog_app

import android.app.PendingIntent
import android.content.Intent
import android.nfc.NfcAdapter
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {


    override fun onResume() {
        super.onResume()
        try {
            val intent = Intent(context, javaClass).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
            val pendingIntent = PendingIntent.getActivity(context, 0, intent, 0)
            NfcAdapter.getDefaultAdapter(context)?.enableForegroundDispatch(this, pendingIntent, null, null)
        }
        catch (e: Exception) {

        }

    }

    override fun onPause() {
        super.onPause()
        try {
            NfcAdapter.getDefaultAdapter(context)?.disableForegroundDispatch(this)
        }
        catch (e: Exception) {

        }

    }
}
